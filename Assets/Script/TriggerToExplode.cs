using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TriggerToExplode : MonoBehaviour {

	// Use this for initialization
	void OnTriggerEnter(Collider coll)
    {
        //if ("Sphere_" + GameObject.Find("LittleDragon").GetComponent<playerTrigger>().modelNum.ToString() == gameObject.name)
        //{
        //BroadcastMessage("Explode");
        //GameObject.Destroy(gameObject);
        //}
    }
}
