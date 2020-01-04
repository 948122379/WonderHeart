using UnityEngine;
using System.Collections;

public class Spin : MonoBehaviour {
    private float Speed;
    private float maxSpeed;
	// Use this for initialization
	void Start () {
        Speed = 0;
        maxSpeed = 6;
	}
	
	// Update is called once per frame
	void Update () {
        if (transform.name == "Magic Circle")
        {
            if (Speed < maxSpeed)
            {
                Speed += Time.deltaTime;
                transform.rotation = Quaternion.Euler(90, Time.time * Mathf.Pow(Speed,2), transform.rotation.z);
            }
            else if (Speed > maxSpeed)
            {
                Speed = maxSpeed;
                transform.rotation = Quaternion.Euler(90, Time.time * Mathf.Pow(Speed, 2), transform.rotation.z);
            }
            else
            {
                transform.rotation = Quaternion.Euler(90, Time.time * Mathf.Pow(Speed, 2), transform.rotation.z);
            }
        }
        else
        {

            if (Speed < 60)
            {
                Speed += Time.deltaTime * 5;
                transform.rotation = Quaternion.Euler(transform.rotation.x, Time.time * Speed, transform.rotation.z);
            }
            else if (Speed >= 60)
            {
                Speed = 60;
                transform.rotation = Quaternion.Euler(transform.rotation.x, Time.time * Speed, transform.rotation.z);
            }
        }
	}
}
