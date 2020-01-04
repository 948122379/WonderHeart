using UnityEngine;
using System.Collections;

public class OnTriggerDestroy : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

    void OnTriggerEnter(Collider coll)
    {
        print(coll.name);
    }
    void OnColliderEnter(Collider coll)
    {
        print(coll.name);
    }
    
}
