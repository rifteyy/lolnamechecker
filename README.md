# lolnamechecker
Check League of Legends usernames in a text file on all regions.

![alt text](https://media.discordapp.net/attachments/869861284621979681/1135234758977261669/Screenshot_4.png)




### How to setup?
1) Create an account on the [Riot Developer Portal](https://developer.riotgames.com/)
2) Regenerate API key, you can do it by solving reCAPTCHA and clicking the big red button saying "regenerate api key"
API key looks like `RGAPI-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx` and you will need to regenerate it every time it expires in order to use LOL name checker.
3) Copy the key and paste it into the `api_key` variable, it looks like this:
```
set "api_key=RGAPI-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
```
Replace the example api key with yours generated.
4) Replace region, region_code, region_shorter variables with corresponding info;
   Variable `region` can contain the following: `americas asia europe sea`
   
   Variable `region_code` can contain the following: `br1 eun1 euw1 jp1 kr la1 na1 oc1 tr1 ru ph2 sg2 th2 tw2 vn2`
   
   Variable `region_shorter` can contain the following: `br eune euw jp kr lan las na oce ph sg th tw vn tr ru`
   
   Note all these info must be 100% correct, or it will not work.


### How to use?
Double click and run, ignore the Windows Defender warning
