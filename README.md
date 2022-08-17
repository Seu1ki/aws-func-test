## Serverless Latency Test at AWS (Lambda)
Invoke 4 functions at ServerlessBench:Testcase8-Function-size <https://github.com/SJTU-IPADS/ServerlessBench.git>.
* aws-pkg20 (22.7MB,imported)
* aws-pkg50 (44.1MB, imported)
* aws-size20 (22.7MB, not imported)
* aws-size50 (44.1MB, not imported)

### Step 1. Vanilla Test
* aws-pkg20
> REPORT RequestId: 18e21600-187a-4b7e-8239-9c34ec7412a2	Duration: 1.74 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 46 MB	Init Duration: 164.31 ms	
> REPORT RequestId: 3d73deeb-cda4-4786-9611-2318742f5b34	Duration: 1.72 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 46 MB	Init Duration: 163.20 ms
> REPORT RequestId: 0ed92f76-8bd4-4560-aa2e-8b90fa26f9f8	Duration: 1.32 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 46 MB	

* aws-pkg50
> REPORT RequestId: 17939bfa-2a9c-42ba-aba5-7be5e79dd446	Duration: 1.62 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 72 MB	Init Duration: 432.06 ms	
> REPORT RequestId: d63cea80-4822-49a6-a06f-351d037e1238	Duration: 1.89 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 72 MB	Init Duration: 456.89 ms	
> REPORT RequestId: 528b5757-3aa6-41e3-8536-2839a3662862	Duration: 2.33 ms	Billed Duration: 3 ms	Memory Size: 128 MB	Max Memory Used: 73 MB	

* aws-size20
> REPORT RequestId: e8faac6c-10e9-4d1f-8028-cdd25ab78ea9	Duration: 1.57 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 112.33 ms	
> REPORT RequestId: 2b135bab-f718-4e10-874e-851f2332dd95	Duration: 2.25 ms	Billed Duration: 3 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 161.64 ms	
> REPORT RequestId: 0ed92f76-8bd4-4560-aa2e-8b90fa26f9f8	Duration: 1.32 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 46 MB	

* aws-size50
> REPORT RequestId: 382356e0-06ba-4ff6-aa5c-ecc7cf0ebfd0	Duration: 7.00 ms	Billed Duration: 8 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 139.19 ms	
> REPORT RequestId: b4bbe6f9-1ec4-4027-a0ea-0ffcdd1e20d9	Duration: 1.70 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 110.23 ms	
> REPORT RequestId: 66bacb60-8a44-4bf0-860b-f8d56705a9d1	Duration: 1.26 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	


<span style="color:red;background-color:#ffdce0;"> REPORT RequestId: 66bacb60-8a44-4bf0-860b-f8d56705a9d1	Duration: 1.26 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	</span>




