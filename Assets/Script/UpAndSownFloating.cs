using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpAndSownFloating : MonoBehaviour
{
    private float radian = 0;//度数
    private float perRadian = 0.15f;//每次变化的度数
    public float radius = 0.04f;//半径
    public Rigidbody rd;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        float y = Floating();
        transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y + y, transform.localPosition.z);
	}
    public float Floating()
    {
        radian += perRadian;
        float dy = Mathf.Cos(radian) * radius;
        return dy;
    }
}
