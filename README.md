## Serverless Latency Test at AWS (Lambda)
Create four functions at ServerlessBench:Testcase8-Function-size <https://github.com/SJTU-IPADS/ServerlessBench.git> and one default function for comparison (baseline).

* aws-default (169.0B, - )
* aws-pkg20 (22.7MB,imported)
* aws-pkg50 (44.1MB, imported)
* aws-size20 (22.7MB, not imported)
* aws-size50 (44.1MB, not imported)

### Step 1. Vanilla Test
* aws-default
```
[COLD] REPORT RequestId: 7906061a-33a0-4d38-8f98-d7996fbcf6eb	Duration: 1.48 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 111.64 ms	
[COLD] REPORT RequestId: 2e99be9b-c25e-4dd0-bfdc-d8f379524847	Duration: 14.05 ms	Billed Duration: 15 ms	Memory Size: 128 MB	Max Memory Used: 35 MB	Init Duration: 116.63 ms	
[WARM] REPORT RequestId: ece55784-3f18-48af-9494-988be0f3dd01	Duration: 1.75 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	
```
* aws-pkg20
```
[COLD] REPORT RequestId: 18e21600-187a-4b7e-8239-9c34ec7412a2	Duration: 1.74 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 46 MB	Init Duration: 164.31 ms   	
[COLD] REPORT RequestId: 3d73deeb-cda4-4786-9611-2318742f5b34	Duration: 1.72 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 46 MB	Init Duration: 163.20 ms   
[WARM] REPORT RequestId: 0ed92f76-8bd4-4560-aa2e-8b90fa26f9f8	Duration: 1.32 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 46 MB	
```

* aws-pkg50
```
[COLD] REPORT RequestId: 17939bfa-2a9c-42ba-aba5-7be5e79dd446	Duration: 1.62 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 72 MB	Init Duration: 432.06 ms   	
[COLD] REPORT RequestId: d63cea80-4822-49a6-a06f-351d037e1238	Duration: 1.89 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 72 MB	Init Duration: 456.89 ms   	
[WARM] REPORT RequestId: 528b5757-3aa6-41e3-8536-2839a3662862	Duration: 2.33 ms	Billed Duration: 3 ms	Memory Size: 128 MB	Max Memory Used: 73 MB	
```

* aws-size20
```
[COLD] REPORT RequestId: e8faac6c-10e9-4d1f-8028-cdd25ab78ea9	Duration: 1.57 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 112.33 ms   	
[COLD] REPORT RequestId: 2b135bab-f718-4e10-874e-851f2332dd95	Duration: 2.25 ms	Billed Duration: 3 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 161.64 ms   	
[WARM] REPORT RequestId: 0ed92f76-8bd4-4560-aa2e-8b90fa26f9f8	Duration: 1.32 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 46 MB	
```

* aws-size50
```
[COLD] REPORT RequestId: 382356e0-06ba-4ff6-aa5c-ecc7cf0ebfd0	Duration: 7.00 ms	Billed Duration: 8 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 139.19 ms   	
[COLD] REPORT RequestId: b4bbe6f9-1ec4-4027-a0ea-0ffcdd1e20d9	Duration: 1.70 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 110.23 ms   	
[WARM] REPORT RequestId: 66bacb60-8a44-4bf0-860b-f8d56705a9d1	Duration: 1.26 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	
```

### Step 2. ECS Fargate Test
AWS ECS Fargate needs Dockerfile, which call the python handler. 
At ```/src/docker```, there are Dockerfile, aws-pkg handler (aws_pkg20.py), and invoker (aws_handler.py). 

To test Fargate, first create an aws_pkg repository in the docker hub, and then create a docker image with the command below.
```bash
$ cd /src/docker
$ docker build -t <docker-username>/<repository>:<version> .
$ docker push <docker-username>/<repository>:<version> .

```
**TO DO: Implement HTTPs in Dockerfile**
The http request processing has not yet been implemented in dockerfile, and after this, it is possible to test the load balancing by connecting the port.

## Reveal the Execution Environment
Create bash function, and run the command below on different environments env A and env B. 
Also, run the same command on AWS EC2(t3.medium) for comparison.
```bash
$ cat /proc/cpuinfo	-> logs/cpuinfo.diff
$ cat /proc/meminfo	-> logs/meminfo.diff
$ cat /etc/os-release	-> logs/os-release.diff
$ whoami
$ lscpu
$ dmesg |grep -i hypervisor
```
When we entered the command ```whoami```,

AWS Lambda answers:
> sbx_user1051

AWS EC2 answers:
> ec2-user

---
**Error:**
When we entered the command ```dmesg |grep -i hypervisor```, we got the msg:
> dmesg: read kernel buffer failed: Operation not permitted


On the other hand, EC2 gave us 
> [    0.000000] Hypervisor detected: KVM



**Error:**
When we entered the command ``` lscpu ```, we got the msg:
> failed to determine number of CPUs: /sys/devices/system/cpu/possible: No such file or directory

