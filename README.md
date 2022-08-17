## Serverless Latency Test at AWS (Lambda)
Invoke 4 functions at ServerlessBench:Testcase8-Function-size <https://github.com/SJTU-IPADS/ServerlessBench.git>.
* aws-pkg20 (22.7MB,imported)
* aws-pkg50 (44.1MB, imported)
* aws-size20 (22.7MB, not imported)
* aws-size50 (44.1MB, not imported)

### Step 1. Vanilla Test
> aws-pkg20
REPORT RequestId: 18e21600-187a-4b7e-8239-9c34ec7412a2	Duration: 1.74 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 46 MB	Init Duration: 164.31 ms	

> aws-pkg50
REPORT RequestId: 17939bfa-2a9c-42ba-aba5-7be5e79dd446	Duration: 1.62 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 72 MB	Init Duration: 432.06 ms	

> aws-size20
REPORT RequestId: e8faac6c-10e9-4d1f-8028-cdd25ab78ea9	Duration: 1.57 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 112.33 ms	

> aws-size50
REPORT RequestId: 382356e0-06ba-4ff6-aa5c-ecc7cf0ebfd0	Duration: 7.00 ms	Billed Duration: 8 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 139.19 ms	





