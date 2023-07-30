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

4) Replace region, region_code, region_shorter variables with corresponding info. You can find more info on the [Riot Developer Portal docs](https://developer.riotgames.com/docs/lol)

   Variable `region` can contain the following: `americas asia europe sea`
   
   Variable `region_code` can contain the following: `br1 eun1 euw1 jp1 kr la1 na1 oc1 tr1 ru ph2 sg2 th2 tw2 vn2`
   
   Variable `region_shorter` can contain the following: `br eune euw jp kr lan las na oce ph sg th tw vn tr ru`
   
5) Put in file `summoner_names.txt` (or change the variable `summoner_names_input` containing the file name to something else) all the summoner names you wanna check. They must be 1 summoner name on each line.


### How to run?
Double click or right click and press run, ignore the Windows Defender warning

### What do I need to have installed?
Nothing, my version does not require Python or any other requirements.

### Is it bannable?
No. You use the public riot API and there is no way of getting banned or suspended for it.


If you have any questions or concerns, contact me on discord @rifteyy.
