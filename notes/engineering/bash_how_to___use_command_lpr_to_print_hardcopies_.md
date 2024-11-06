# use command lpr to print hardcopies

TL;DR: `lpr -p -o EPIJ_Silt=1 -o Resolution=720x720dpi -o EPIJ_Qual=307 ./lpoptoins.pdf`

Use `lpoptions -l` to show custom options for printer, such as `EPIJ_Qual/Print
Quality: 308 311 *303 309 304 305 306 307`.

Note that only `EPIJ_Qual` is used in printing option e.g. `lpr -o
EPIJ_Qual=308`, the text after `/` is an short description of the option.

Example output of `lpoptions -l`

```
$ lpoptions -l
...
EPIJ_Ink_/Grayscale: *1 0
EPIJ_Qual/Print Quality: 308 311 *303 309 304 305 306 307
ColorModel/ColorModel: *RGB Mono
Resolution/Resolution: 180x180dpi *360x360dpi 720x720dpi
PageSize/Media Size: *A4 EPKG EPKG.NMgn EPPhotoPaper2L A6 A5 B5 B6 EPPhotoPaperLRoll EPPhotoPaperLRoll.NMgn EPIndexCard5x8 EP8x10in EPHiVision102x180 EPHiVision102x180.NMgn EPPostcard100x148 EPPostcard100x148.NMgn Env10 EnvDL EnvC6 Letter EP216x330mm EPIndianLegal Legal EP16K195x270mm Custom.WIDTHxHEIGHT
EPIJ_Silt/Quiet Mode: *0 1
...
```

upzip `/Library/Printers/PPDs/Contents/Resources/EPSON\ ET-2810\ Series.gz` to
`~/Documents/downloads/` read the mearning of options.

Run the following command in the unzipped `downloads` folder
```
$ cat EPSON\ ET-2820\ Series | grep Qua
...
*EPIJ_Qual 308/Draft: ""
*EPIJ_Qual 311/Draft-Vivid : ""
*EPIJ_Qual 303/Normal: ""
*EPIJ_Qual 309/Normal-Vivid: ""
*EPIJ_Qual 304/Fine: ""
*EPIJ_Qual 305/Quality: ""
*EPIJ_Qual 306/High Quality: ""
*EPIJ_Qual 307/Best Quality: ""
...
```

Other Useful Links: 

- local Cups link: http://localhost:631/
    - logins with laptops's username and password
- `/private/etc/cups/ppd`
    - printer ppd file - Postscript Printer Description file is a file that describes the font s, paper sizes, resolution , and other capabilities that are standard for a particular Postscript printer

