using UnityEngine;
using System.Collections;
using UnityStandardAssets.Characters.FirstPerson;//获取第一人称组件
using UnityEngine.UI;//获取UI组件
using UnityEngine.SceneManagement;//更换场景

public class GameLogic : MonoBehaviour {
    //可交互提示高光反应
    public Shader RimLight;//高光Shader
    public int minDistance=4;//可交互距离
    const int NeedNum = 7;//可交互物体数量
    private Shader[] oldShaderArray;//以前shader数组
    private string[] needChangRimLightName;//需要描边的物体名字数组
    private bool[] isChangeRimLight;//记录是否已交换高光数组&&用来判断是否可交互

    //是否已经触发交互
    private bool[] haveChangeRimLight;
    private bool sofeRotateSwitchOn = false;
    private bool isGetPeachHeart = false;
    private bool isLayPeachHeart = false;
    private string lastSelect = "";
    private bool isCanDestroyMiddleWall = false;

    //延时器
    private float timer = 0;

    //字符串
    private string middleWallsName = "middleWall/middleWall/@middleWall (single mesh)/middleWall";
    //
    public Component FirstPersonController;
	// Use this for initialization
	void Start () {
        oldShaderArray = new Shader[NeedNum];
        needChangRimLightName = new string[NeedNum];
        isChangeRimLight = new bool[NeedNum];
        haveChangeRimLight = new bool[NeedNum];

        needChangRimLightName[0] = "Loft01";//第一间里的台灯
        needChangRimLightName[1] = "Base";//第一间里的烛灯
        needChangRimLightName[2] = "Peach heart";//第一间解谜成功后，台柱上出现的那个桃心
        needChangRimLightName[3] = "Peach heart glass";//第二间的桃心钥匙放置位置
        needChangRimLightName[4] = "Root";//第二间的真实心脏
        needChangRimLightName[5] = "StoryBook";//第一间的小桌子上的书
        needChangRimLightName[6] = "YourInformation";//你的背景信息

        for (int i = 0; i < NeedNum; i++)
        {
            isChangeRimLight[i] = false;
            haveChangeRimLight[i] = false;
            oldShaderArray[i] = GetRenderer(needChangRimLightName[i]).material.shader;
        }

        FirstPersonController = null;
    }
	
	// Update is called once per frame
    void Update()
    {
        //第一间谜题   
        //第一间谜题全部解开，显示桃心钥匙
        if (GetGameObject("Projector Table/projector").transform.rotation.y == 0
            && GetGameObject("Chandelier Ground/Point light").GetComponent<Light>().enabled == false//烛光消失
            && GetGameObject("Table lamp/Point light").GetComponent<Light>().enabled == false)//灯光消失
        {
            if (isGetPeachHeart == false)
            {
                GetRenderer("Peach heart").enabled = true;
            }
        }
        else
        {
            GetRenderer("Peach heart").enabled = false;
        }

        //判断是否可交互
        Ray ray = gameObject.GetComponentInChildren<Camera>().ScreenPointToRay(Input.mousePosition);
        RaycastHit hitInfo;//返回碰撞信息
        if (Physics.Raycast(ray, out hitInfo))
        {
            string nameBePoint = hitInfo.collider.gameObject.name;//获得碰撞到的物体
            for (int i = 0; i < NeedNum; i++)
            {
                if (GetRenderer(needChangRimLightName[i]) != null)//如果照射物体shader存在
                {
                    if (nameBePoint == needChangRimLightName[i] && Disdance(needChangRimLightName[i]) < minDistance)
                    {
                        GetRenderer(needChangRimLightName[i]).material.shader = RimLight;
                        isChangeRimLight[i] = true;
                    }
                    else if (nameBePoint != needChangRimLightName[i] && isChangeRimLight[i] == true)
                    {
                        GetRenderer(needChangRimLightName[i]).material.shader = oldShaderArray[i];
                        isChangeRimLight[i] = false;
                    }
                }
            }
            //index = GetMyIndex(gameobj.name);
            //ChangeShader(gameobj.name);
        }

        //左键、A键交互
        if (Input.GetKeyDown(KeyCode.Mouse0) || Input.GetKeyDown(KeyCode.Joystick1Button0))
        {
            for (int i = 0; i < NeedNum; i++)
            {
                if (haveChangeRimLight[i] == false && isChangeRimLight[i] == true)//如果这个机关可以触发并且处于未触发的状态
                {
                    if (needChangRimLightName[i] == "Loft01")//1第一间里的台灯
                    {
                        GetGameObject("Table lamp").GetComponent<AudioSource>().Play();

                        GetGameObject("Table lamp/Point light").GetComponent<Light>().enabled = true;//灯光打开
                        GetRenderer("Table lamp/Point light/Glow").enabled = true;
                        GetRenderer("Snuggle/Box012/Plane008").enabled = true;
                        sofeRotateSwitchOn = true;//打开旋转投影仪的开关
                    }
                    else if (needChangRimLightName[i] == "Base")//2第一间里的烛灯
                    {
                        GetGameObject("Chandelier Ground").GetComponent<AudioSource>().Play();

                        GetGameObject("Chandelier Ground/Point light").GetComponent<Light>().enabled = false;//烛光消失
                        GetRenderer("Chandelier Ground/Point light/Glow1").enabled = false;
                        GetRenderer("Chandelier Ground/Point light/Glow2").enabled = false;
                        GetRenderer("Chandelier Ground/Point light/Glow3").enabled = false;
                        GetSpriteRenderer("Mural Tip").enabled = true;

                        GetRenderer("Projector Table/projector/lightlinePaticals").enabled = true;//打开老投影仪的灯光效果
                        GetGameObject("Projector Table/projector/Spotlight").GetComponent<Light>().enabled = true;
                    }
                    else if (needChangRimLightName[i] == "Peach heart")//3第一间解谜成功后，台柱上出现的那个桃心
                    {
                        isGetPeachHeart = true;
                        GetRenderer("Peach heart").enabled = false;
                        GetRenderer("FPSController/FirstPersonCharacter/Peach heart get").enabled = true;
                        //墙破碎
                        //GetRenderer("middleWall/middleWall/@middleWall (single mesh)").enabled = false;
                        GetGameObject("middleWall/middleWallCollider").GetComponent<MeshCollider>().enabled = false;
                        GetGameObject("middleWall/Sphere Collider").GetComponent<Rigidbody>().isKinematic = false;

                        timer = Time.time;
                        isCanDestroyMiddleWall = true;
                    }
                    else if (needChangRimLightName[i] == "Peach heart glass")//4第二间的桃心钥匙放置位置
                    {
                        GetGameObject("Magic Circle/Magic Circle").GetComponent<AudioSource>().Play();

                        GetRenderer("Magic Circle/PeachHeart Place/Peach heart last").enabled = true;
                        GetRenderer("FPSController/FirstPersonCharacter/Peach heart get").enabled = false;
                        isLayPeachHeart = true;

                        GetGameObject("Magic Circle/PeachHeart Place").GetComponent<UpAndSownFloating>().enabled = false;
                    }
                    else if (needChangRimLightName[i] == "Root")//5第二间的真实心脏
                    {
                        GetGameObject("Tips/EatHeart").transform.rotation = new Quaternion(0, 0, 0, 0);
                        GetGameObject("Tips/EatHeart/Text").GetComponent<TypewriterEffect>().enabled = true;
                        GetGameObject("FPSController").GetComponent<FirstPersonController>().enabled = false;//关闭动作输入
                    }
                    else if (needChangRimLightName[i] == "StoryBook")//6第一间的小桌子上的书,第一次触碰打开旋转投影仪的开关
                    {
                        GetGameObject("StoryBook").GetComponent<AudioSource>().Play();

                        GetGameObject("Tips/StoryBook").transform.rotation = new Quaternion(0, 0, 0, 0);
                        GetGameObject("FPSController").GetComponent<FirstPersonController>().enabled = false;//关闭动作输入
                    }
                    else if (needChangRimLightName[i] == "YourInformation")//7你的背景信息
                    {
                        GetGameObject("YourInformation").GetComponent<AudioSource>().Play();

                        GetGameObject("Tips/YourInformation Tip").transform.rotation = new Quaternion(0, 0, 0, 0);
                        GetGameObject("FPSController").GetComponent<FirstPersonController>().enabled = false;//关闭动作输入
                    }
                    haveChangeRimLight[i] = true;
                }

                else if (haveChangeRimLight[i] == true && isChangeRimLight[i] == true)//如果这个机关可以触发并且处于已触发的状态
                {
                    if (needChangRimLightName[i] == "Loft01")//1第一间里的台灯已触发
                    {
                        GetGameObject("Table lamp").GetComponent<AudioSource>().Play();

                        GetGameObject("Table lamp/Point light").GetComponent<Light>().enabled = false;//灯光消失
                        GetRenderer("Table lamp/Point light/Glow").enabled = false;
                        GetRenderer("Snuggle/Box012/Plane008").enabled = false;
                        sofeRotateSwitchOn = false;//关闭旋转投影仪的开关
                    }
                    else if (needChangRimLightName[i] == "Base")//2第一间里的烛灯已触发
                    {
                        GetGameObject("Chandelier Ground").GetComponent<AudioSource>().Play();

                        GetGameObject("Chandelier Ground/Point light").GetComponent<Light>().enabled = true;//烛光消失
                        GetRenderer("Chandelier Ground/Point light/Glow1").enabled = true;
                        GetRenderer("Chandelier Ground/Point light/Glow2").enabled = true;
                        GetRenderer("Chandelier Ground/Point light/Glow3").enabled = true;
                        GetSpriteRenderer("Mural Tip").enabled = false;

                        GetRenderer("Projector Table/projector/lightlinePaticals").enabled = false;//关闭老投影仪的灯光效果
                        GetGameObject("Projector Table/projector/Spotlight").GetComponent<Light>().enabled = false;
                    }
                    else if (needChangRimLightName[i] == "Peach heart")//3第一间解谜成功后，台柱上出现的那个桃心已触发
                    {

                    }
                    else if (needChangRimLightName[i] == "Peach heart glass")//4第二间的桃心钥匙放置位置已触发
                    {

                    }
                    else if (needChangRimLightName[i] == "Root")//5第二间的真实心脏已触发
                    {
                        GetGameObject("Tips/EatHeart").transform.rotation = new Quaternion(0, 0, 0, 0);
                        GetGameObject("FPSController").GetComponent<FirstPersonController>().enabled = false;//关闭动作输入
                    }
                    else if (needChangRimLightName[i] == "StoryBook")//6第一间的小桌子上的书已触发
                    {
                        GetGameObject("StoryBook").GetComponent<AudioSource>().Play();

                        GetGameObject("Tips/StoryBook").transform.Rotate(new Vector3(0, -90, 0));
                        GetGameObject("FPSController").GetComponent<FirstPersonController>().enabled = true;//打开动作输入
                    }
                    else if (needChangRimLightName[i] == "YourInformation")//7你的背景信息已触发
                    {
                        GetGameObject("YourInformation").GetComponent<AudioSource>().Play();

                        GetGameObject("Tips/YourInformation Tip").transform.Rotate(new Vector3(0, -90, 0));
                        GetGameObject("FPSController").GetComponent<FirstPersonController>().enabled = true;//打开动作输入
                    }
                    haveChangeRimLight[i] = false;
                }
            }
        }
        print(timer);
        print(GetGameObject("middleWall/middleWall/@middleWall (single mesh)"));
        //拿下桃心钥匙后，1秒后完整墙体不可见，2秒后清掉障碍物的Collider,5秒后Destroy掉
        if (isCanDestroyMiddleWall == true)
        {
            if (Time.time - timer > 1 && Time.time - timer < 2)
            {
                if (GetRenderer("middleWall/middleWall/@middleWall (single mesh)").enabled == true)
                {
                    GetRenderer("middleWall/middleWall/@middleWall (single mesh)").enabled = false;
                }
            }
            else if (Time.time - timer > 2 && Time.time - timer < 3)
            {
                for (int i = 1; i < 11; i++)
                {
                    if (GetGameObject(middleWallsName + i.ToString()).GetComponent<BoxCollider>() != null)
                    {
                        if (GetGameObject(middleWallsName + i.ToString()).GetComponent<BoxCollider>().enabled == true)
                        {
                            GetGameObject(middleWallsName + i.ToString()).GetComponent<BoxCollider>().enabled = false;
                        }
                    }
                    else if (GetGameObject(middleWallsName + i.ToString()).GetComponent<MeshCollider>() != null)
                    {
                        if (GetGameObject(middleWallsName + i.ToString()).GetComponent<MeshCollider>().enabled == true)
                        {
                            GetGameObject(middleWallsName + i.ToString()).GetComponent<MeshCollider>().enabled = false;
                        }
                    }
                }
            }
            else if (Time.time - timer > 5 && Time.time - timer < 6)
            {
                for (int i = 1; i < 11; i++)
                {
                    if (GetGameObject(middleWallsName + i.ToString()) != null)
                    {
                        Destroy(GetGameObject(middleWallsName + i.ToString()));
                    }
                }
            }
        }

        //桃心钥匙装置下沉两秒后,显示心脏
        if (isLayPeachHeart == true)
        {
            if (GetRenderer("Magic Circle/PeachHeart Place/Peach heart last").enabled == true && GetGameObject("Magic Circle/PeachHeart Place").transform.position.y > -0.4)
            {
                GetGameObject("Magic Circle/Realy heart").transform.position = new Vector3(0f, GetGameObject("Magic Circle/Realy heart").transform.position.y, 19.09f);
                GetGameObject("Magic Circle/PeachHeart Place").transform.Translate(new Vector3(0, 0, -Time.deltaTime));
            }
            else if (GetRenderer("Magic Circle/PeachHeart Place/Peach heart last").enabled == true && GetGameObject("Magic Circle/PeachHeart Place").transform.position.y <= -0.4)
            {
                GetRenderer("Magic Circle/Magic Circle/Particle System").enabled = true;
                GetGameObject("Magic Circle/Magic Circle").GetComponent<Spin>().enabled = true;
                GetRenderer("Magic Circle/PeachHeart Place/Peach heart last").enabled = false;
                GetRenderer("Magic Circle/PeachHeart Place/Peach heart glass").enabled = false;
                isLayPeachHeart = false;
                GetRenderer("Magic Circle/Realy heart/Root").enabled = true;
            }
        }
        //心脏出现后从地上冒出
        if (GetRenderer("Magic Circle/Realy heart/Root").enabled == true && GetGameObject("Magic Circle/Realy heart").transform.position.y < 2.47)
        {
            GetGameObject("Magic Circle/Realy heart").transform.position = new Vector3(0.29f, GetGameObject("Magic Circle/Realy heart").transform.position.y, 19.09f);
            GetGameObject("Magic Circle/Realy heart").transform.Translate(new Vector3(0, Time.deltaTime, 0));
        }
    }

    void OnTriggerEnter(Collider coll){
        if (coll.transform.name == "Box012" && sofeRotateSwitchOn==true)//沙发靠背
        {
            GameObject.Find("Projector Table/projector").transform.Rotate(new Vector3(0,90,0));
            GetGameObject("Projector Table/Projector Table").GetComponent<AudioSource>().Play();
        }
    }

    GameObject GetGameObject(string name)//查不到active为false的物体
    {
        return GameObject.Find(name);
    }

    Transform GetTransform(string name)//可以查到active为false的物体,但是只能查此脚本所附的物体
    {
        return transform.Find("");
    }

    Renderer GetRenderer(string name)
    {
        //print(name);
        return GameObject.Find(name).GetComponent<Renderer>();
    }

    SpriteRenderer GetSpriteRenderer(string name)
    {
        return GameObject.Find(name).GetComponent<SpriteRenderer>();
    }

    float Disdance(string name)
    {
        Vector3 aim = GameObject.Find(name).transform.position;
        float dis = Mathf.Sqrt(
            Mathf.Pow(aim.x - transform.position.x, 2) +
            Mathf.Pow(aim.y - transform.position.y, 2) +
            Mathf.Pow(aim.z - transform.position.z, 2));
        return dis;
    }

    public void selectYes()
    {
        lastSelect = "Yes";//没用
        GetRenderer("Magic Circle/Realy heart/Root").enabled = false;//心脏消失
        GetGameObject("Tips/EatHeart").transform.Rotate(new Vector3(0, -90, 0));
        GetGameObject("FPSController").GetComponent<FirstPersonController>().enabled = true;//打开动作输入
        GetGameObject("Tips/LastWord").transform.rotation = new Quaternion(0, 0, 0, 0);
        GetGameObject("Tips/Operation tip").GetComponent<Text>().text = "游戏结束";
    }
    public void selectNo()
    {
        lastSelect = "No";//没用
        GetGameObject("Tips/EatHeart").transform.Rotate(new Vector3(0, -90, 0));
        GetGameObject("FPSController").GetComponent<FirstPersonController>().enabled = true;//打开动作输入
    }
    public void Quit()
    {
        Application.Quit();
    }
    public void Restart()
    {
        SceneManager.LoadScene("Heart");
    }
}
