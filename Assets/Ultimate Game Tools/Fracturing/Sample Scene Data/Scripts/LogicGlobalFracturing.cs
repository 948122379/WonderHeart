using UnityEngine;
using System.Collections;

public class LogicGlobalFracturing : MonoBehaviour
{
    [HideInInspector]
    public static bool HelpVisible = true;

    void Start()
    {
        HelpVisible = true;
    }

    public static void GlobalGUI()
    {
    }

    void Update()
    {
        for(int i = 0; i < Application.levelCount; i++)
        {
            if(Input.GetKeyDown(KeyCode.Alpha1 + i)) Application.LoadLevel(i);
        }

        if(Input.GetKeyDown(KeyCode.F1))
        {
            HelpVisible = !HelpVisible;
        }
    }
}
