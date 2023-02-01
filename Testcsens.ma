//Maya ASCII 2023 scene
//Name: Testcsens.ma
//Last modified: Wed, Feb 01, 2023 02:25:05 PM
//Codeset: 1251
requires maya "2023";
requires "stereoCamera" "10.0";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" "mtoa" "5.2.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2023";
fileInfo "version" "2023";
fileInfo "cutIdentifier" "202208031415-1dee56799d";
fileInfo "osv" "Windows 10 Enterprise v2009 (Build: 19045)";
fileInfo "UUID" "05048448-4CFE-952B-15F4-05B7669D59EC";
createNode transform -s -n "persp";
	rename -uid "C7EF48AD-4DD0-51A5-6438-77AA71778205";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -7.276749532172671 13.176085109520198 17.624613520189481 ;
	setAttr ".r" -type "double3" -35.138352729602644 -23.799999999999933 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "E44283D6-42D0-257E-15D9-2CA01E3A7991";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 22.892922573018154;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.27803104163153025 -5.9978266631066646e-08 0.4956329894632826 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "F03DEB2E-43EE-0691-CCBE-D3B074CB38E3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "E4E94067-4C50-8817-2C55-9594A2AAEA43";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "DBFF683B-4108-D151-2B54-F38A6D0E2E39";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "B6A66CE9-4E7B-FDBC-7E3D-4DB46B7133E5";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "pSphere2";
	rename -uid "4661E963-4EA7-CB22-B25A-D3980A96A69D";
createNode mesh -n "pSphereShape2" -p "pSphere2";
	rename -uid "6E4DFEBE-4D42-1142-8A03-999E6634AF3E";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "nurbsSquare1";
	rename -uid "AA7A1F8C-4BD2-CB6E-15C9-99B77A93EE00";
createNode transform -n "topnurbsSquare1" -p "nurbsSquare1";
	rename -uid "29A846FE-49D9-11D9-847E-058F4E4F7820";
createNode nurbsCurve -n "topnurbsSquareShape1" -p "topnurbsSquare1";
	rename -uid "B3C3F928-4B4B-1147-DA5F-29BC8A0397A3";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "leftnurbsSquare1" -p "nurbsSquare1";
	rename -uid "3901F8C8-4667-8188-8C9E-FDB539B69472";
createNode nurbsCurve -n "leftnurbsSquareShape1" -p "leftnurbsSquare1";
	rename -uid "3552CB66-4F8F-15A9-E8FE-44B7EC7E6761";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -s -n "side" -p "leftnurbsSquare1";
	rename -uid "2EDE699E-4709-7CC4-4590-96B6B52668AD";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "196B3853-4A38-BE37-1F4A-E089B155C9F9";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "bottomnurbsSquare1" -p "nurbsSquare1";
	rename -uid "80299FEA-4FB6-3F20-6A5C-A0BCAC0EDBEF";
createNode nurbsCurve -n "bottomnurbsSquareShape1" -p "bottomnurbsSquare1";
	rename -uid "BB869522-43E4-8362-0219-1E83399B5FAC";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "rightnurbsSquare1" -p "nurbsSquare1";
	rename -uid "CBFC2882-4BD5-7427-11B4-41904BF87E9A";
createNode nurbsCurve -n "rightnurbsSquareShape1" -p "rightnurbsSquare1";
	rename -uid "1F733BA4-4A31-68EF-6AA7-80AA4FDEB812";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "nurbsCircle1";
	rename -uid "757AC9CE-4B31-BF85-AD28-5A9EBE3EBFC9";
createNode nurbsCurve -n "nurbsCircleShape1" -p "nurbsCircle1";
	rename -uid "5078EF58-48C4-7155-3838-9AB8CFAD0668";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode joint -n "joint1";
	rename -uid "E983357D-45AF-69F7-AD13-968B152F1F64";
	setAttr ".t" -type "double3" -12.557332059790376 0 0.73240168508175429 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -65.696978218955834 0 ;
	setAttr ".radi" 0.99717837596263348;
createNode joint -n "joint2" -p "joint1";
	rename -uid "39D545BE-483C-DA07-4FF0-E5A5DCC3ABE3";
	setAttr ".t" -type "double3" 10.612115268610914 0 -4.4408920985006262e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 69.249687962294473 0 ;
	setAttr ".radi" 1.2681523671992534;
createNode joint -n "joint3" -p "joint2";
	rename -uid "51354FAF-4263-1334-2F3D-9EBB8263FCC9";
	setAttr ".t" -type "double3" 15.850945765852227 0 7.7715611723760958e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 141.46546893346397 0 ;
	setAttr ".radi" 1.4279829734837086;
createNode joint -n "joint4" -p "joint3";
	rename -uid "F0325F17-43FF-6651-CE17-13A194C5BDD6";
	setAttr ".t" -type "double3" 18.941004154018362 0 1.7763568394002505e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 214.98182132319738 0 ;
	setAttr ".radi" 1.4279829734837086;
createNode transform -n "spotLight2";
	rename -uid "97E06519-4735-3A4F-FE6D-799C97686354";
createNode spotLight -n "spotLightShape2" -p "spotLight2";
	rename -uid "53347FAC-468C-693A-6C3F-4AA7DCBAB0D1";
	setAttr -k off ".v";
createNode transform -n "directionalLight1";
	rename -uid "867EA57B-45EB-EDFA-AD41-3595E46FCC98";
createNode directionalLight -n "directionalLightShape1" -p "directionalLight1";
	rename -uid "D7136919-4E05-C773-C3CF-7C893D667FE3";
	setAttr -k off ".v";
createNode transform -n "ambientLight1";
	rename -uid "71CE9F96-4A9B-3A3E-40B2-4A9362D8D81B";
createNode ambientLight -n "ambientLightShape1" -p "ambientLight1";
	rename -uid "18A62B11-4DA8-CB1C-45F8-29AF63346064";
	setAttr -k off ".v";
	setAttr ".urs" no;
createNode transform -n "volumeLight1" -p "ambientLight1";
	rename -uid "0D22C928-49E5-0BCB-BB04-E6A057169323";
createNode volumeLight -n "volumeLightShape1" -p "volumeLight1";
	rename -uid "734790C7-4133-B1BE-33B3-D1947C308A29";
	setAttr -k off ".v";
	setAttr -s 2 ".crg";
	setAttr ".crg[0].crgp" 0;
	setAttr ".crg[0].crgc" -type "float3" 0 0 0 ;
	setAttr ".crg[0].crgi" 1;
	setAttr ".crg[1].crgp" 1;
	setAttr ".crg[1].crgc" -type "float3" 1 1 1 ;
	setAttr ".crg[1].crgi" 1;
	setAttr -s 2 ".pen[0:1]"  0 0 1 1 1 1;
createNode transform -n "pointLight1";
	rename -uid "F59B3727-4306-FA3A-0470-2BB89A3305CE";
createNode pointLight -n "pointLightShape1" -p "pointLight1";
	rename -uid "1328A685-451B-3EC5-694E-5CBF8FDC2A73";
	setAttr -k off ".v";
createNode transform -n "areaLight1";
	rename -uid "09E1E032-418F-0185-9C03-29922968808F";
createNode areaLight -n "areaLightShape1" -p "areaLight1";
	rename -uid "8B59068B-4BE1-623A-DE7E-5793993FC478";
	setAttr -k off ".v";
createNode transform -n "nurbsSquare2";
	rename -uid "969DDB30-4F26-C416-3D35-CB86D938B0FF";
createNode transform -n "topnurbsSquare2" -p "nurbsSquare2";
	rename -uid "6CFB5A35-4E4A-159E-A045-1C83EA507DF1";
createNode nurbsCurve -n "topnurbsSquareShape2" -p "topnurbsSquare2";
	rename -uid "0903B291-4E94-C36D-82B2-FB83EE7A3E7D";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "leftnurbsSquare2" -p "nurbsSquare2";
	rename -uid "8B564A7E-4E09-3B76-1C83-AF83E482B686";
createNode nurbsCurve -n "leftnurbsSquareShape2" -p "leftnurbsSquare2";
	rename -uid "44A7BAF0-4172-B83D-E8BB-B6A1E70BBAE1";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "bottomnurbsSquare2" -p "nurbsSquare2";
	rename -uid "18B78F60-44E7-2196-1101-DAA3BF6DEE7E";
createNode nurbsCurve -n "bottomnurbsSquareShape2" -p "bottomnurbsSquare2";
	rename -uid "A24FEF89-4822-62A4-D392-2595D02A3302";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "rightnurbsSquare2" -p "nurbsSquare2";
	rename -uid "E9AA2174-45F8-DE11-65F3-3BA1461F7E78";
createNode nurbsCurve -n "rightnurbsSquareShape2" -p "rightnurbsSquare2";
	rename -uid "038BED0E-4715-D71E-1076-7A9C6E9BC010";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "nurbsCircle2";
	rename -uid "B2F85160-42A9-5A76-2BFD-F4A63F697E3C";
createNode nurbsCurve -n "nurbsCircleShape2" -p "nurbsCircle2";
	rename -uid "AC4AA199-46B4-5A37-B0F1-14B8E942C4FD";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "nurbsSphere1";
	rename -uid "323F9FEE-439A-DB71-7150-5EA8885FF97B";
createNode nurbsSurface -n "nurbsSphereShape1" -p "nurbsSphere1";
	rename -uid "A8014EBD-4BDB-ABDE-7030-8E8D14C5F664";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "nurbsCube1";
	rename -uid "7C1A227D-4E12-E13D-FEEA-62879CFAFFBC";
createNode transform -n "topnurbsCube1" -p "nurbsCube1";
	rename -uid "F216845B-45A1-FBF2-6B76-D6B8A293A62B";
createNode nurbsSurface -n "topnurbsCubeShape1" -p "topnurbsCube1";
	rename -uid "BD2F5299-4ACE-4720-F9B4-9998C79EE009";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
createNode transform -n "bottomnurbsCube1" -p "nurbsCube1";
	rename -uid "295C6A95-453D-868D-C29B-E68B2456A75F";
createNode nurbsSurface -n "bottomnurbsCubeShape1" -p "bottomnurbsCube1";
	rename -uid "B1325CE0-4AFC-2DA8-930C-938132BA1597";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
createNode transform -n "leftnurbsCube1" -p "nurbsCube1";
	rename -uid "FF0BB14A-441B-5A92-983C-2486502D3CEF";
createNode nurbsSurface -n "leftnurbsCubeShape1" -p "leftnurbsCube1";
	rename -uid "034FC3E5-4A89-7662-1A31-AC900CACF4B4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
createNode transform -n "rightnurbsCube1" -p "nurbsCube1";
	rename -uid "2EE23768-41FD-F92C-E6F5-ED893D7C8488";
createNode nurbsSurface -n "rightnurbsCubeShape1" -p "rightnurbsCube1";
	rename -uid "70D31B27-4B39-DAE8-B40A-39B0CEEC7DE8";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
createNode transform -n "frontnurbsCube1" -p "nurbsCube1";
	rename -uid "84337CDA-499A-D455-00EB-01800D9FD248";
createNode nurbsSurface -n "frontnurbsCubeShape1" -p "frontnurbsCube1";
	rename -uid "AE1910A5-4970-9269-BB3D-CEBCB808B24D";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
createNode transform -n "backnurbsCube1" -p "nurbsCube1";
	rename -uid "DF91BE89-4140-9411-B336-8488BFDD38DA";
createNode nurbsSurface -n "backnurbsCubeShape1" -p "backnurbsCube1";
	rename -uid "F4538B1A-4A59-0E0C-08D7-AF841599DCDA";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
createNode transform -n "spotLight1";
	rename -uid "D5CF4799-41C4-BAFF-A090-FFA021BB429A";
createNode spotLight -n "spotLightShape1" -p "spotLight1";
	rename -uid "56ECFA6A-4975-51D5-9CA1-219330BCB9CB";
	setAttr -k off ".v";
createNode transform -n "hairSystem1";
	rename -uid "70C41C33-44DA-570D-7808-CC988F73FBED";
createNode hairSystem -n "hairSystemShape1" -p "hairSystem1";
	rename -uid "679F7817-4F63-FB20-2805-D8B3A6DB4D83";
	setAttr -k off ".v";
	setAttr -s 64 ".ih";
	setAttr ".evo" 0;
	setAttr ".sfn" 0.1;
	setAttr -s 2 ".sts[0:1]"  0 1 1 1 0.2 1;
	setAttr -s 2 ".ats[0:1]"  0 1 1 1 0.2 1;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr ".clc[0]"  0 0.5 1;
	setAttr ".cfl[0]"  0 0 1;
	setAttr -s 2 ".hws[0:1]"  0.80000001 1 1 1 0.2 1;
	setAttr -s 3 ".hcs";
	setAttr ".hcs[0].hcsp" 0;
	setAttr ".hcs[0].hcsc" -type "float3" 0.5 0.5 0.5 ;
	setAttr ".hcs[0].hcsi" 1;
	setAttr ".hcs[1].hcsp" 0.30000001192092896;
	setAttr ".hcs[1].hcsc" -type "float3" 0.80000001 0.80000001 0.80000001 ;
	setAttr ".hcs[1].hcsi" 1;
	setAttr ".hcs[2].hcsp" 1;
	setAttr ".hcs[2].hcsc" -type "float3" 1 1 1 ;
	setAttr ".hcs[2].hcsi" 1;
	setAttr ".dsc[0]"  0 1 1;
	setAttr ".actv" yes;
createNode transform -n "pSphere2Follicle606";
	rename -uid "24B12171-4DB3-C270-515B-4FB65DDA7D3E";
createNode follicle -n "pSphere2FollicleShape606" -p "pSphere2Follicle606";
	rename -uid "E4185C7A-48D1-80E5-417E-058B6FC2E86A";
	setAttr -k off ".v";
	setAttr ".pu" 0.0625;
	setAttr ".pv" 0.0625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve1" -p "pSphere2Follicle606";
	rename -uid "7E9F63F9-4CBA-2568-9FD1-18B577AA0D8C";
createNode nurbsCurve -n "curveShape1" -p "curve1";
	rename -uid "75F1AA98-49AC-45D7-73BE-45ACA9EAF960";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "hairSystem1Follicles";
	rename -uid "459D6D16-4718-23CA-08DA-5DBA8B87A5A2";
createNode transform -n "pSphere2Follicle619" -p "hairSystem1Follicles";
	rename -uid "0713DE66-41EC-8D71-F1B0-81A203303FAF";
createNode follicle -n "pSphere2FollicleShape619" -p "pSphere2Follicle619";
	rename -uid "77D6F73C-42CA-0655-5D0F-C2827D9F2760";
	setAttr -k off ".v";
	setAttr ".pu" 0.0625;
	setAttr ".pv" 0.1875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve2" -p "pSphere2Follicle619";
	rename -uid "1F09B936-4605-B4ED-3BF7-ECA257815D1A";
createNode nurbsCurve -n "curveShape2" -p "curve2";
	rename -uid "907F2F58-422F-4055-D32C-91B8AB587C42";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle631" -p "hairSystem1Follicles";
	rename -uid "F86023A5-49E1-52B9-C37F-A8AE7F4841A9";
createNode follicle -n "pSphere2FollicleShape631" -p "pSphere2Follicle631";
	rename -uid "00CF2B37-4859-A597-6F16-F7A829C9C11D";
	setAttr -k off ".v";
	setAttr ".pu" 0.0625;
	setAttr ".pv" 0.3125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve3" -p "pSphere2Follicle631";
	rename -uid "BD2304EE-4EFE-5998-DEBA-A9AED3552319";
createNode nurbsCurve -n "curveShape3" -p "curve3";
	rename -uid "3B44D1B4-4EE2-22BC-BFD0-9E889BA87D3F";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle643" -p "hairSystem1Follicles";
	rename -uid "C9A44B8B-4809-891E-7D42-329AF36183E3";
createNode follicle -n "pSphere2FollicleShape643" -p "pSphere2Follicle643";
	rename -uid "A7AE11C5-45A6-6B0E-18DC-D1A63A9D4167";
	setAttr -k off ".v";
	setAttr ".pu" 0.0625;
	setAttr ".pv" 0.4375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve4" -p "pSphere2Follicle643";
	rename -uid "67F9E0E5-42CE-1FEA-1FA3-B6920C379237";
createNode nurbsCurve -n "curveShape4" -p "curve4";
	rename -uid "E1994B60-451B-1726-4A32-0BA656D6BAB6";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle656" -p "hairSystem1Follicles";
	rename -uid "732C798C-45C3-A965-FA41-F1AA86CBA45C";
createNode follicle -n "pSphere2FollicleShape656" -p "pSphere2Follicle656";
	rename -uid "3292C12C-4CB2-F678-7A5E-6391C3FF7660";
	setAttr -k off ".v";
	setAttr ".pu" 0.0625;
	setAttr ".pv" 0.5625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve5" -p "pSphere2Follicle656";
	rename -uid "27F45128-44BF-0900-0DA6-D291B405002F";
createNode nurbsCurve -n "curveShape5" -p "curve5";
	rename -uid "B9D162AD-4534-4EEB-F13F-9E83BDE6FDF5";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle668" -p "hairSystem1Follicles";
	rename -uid "15A1B990-4CA1-0ABC-0F2A-46A34366C40F";
createNode follicle -n "pSphere2FollicleShape668" -p "pSphere2Follicle668";
	rename -uid "0C519D2E-4FEE-6DA6-DE18-7C9E2074642C";
	setAttr -k off ".v";
	setAttr ".pu" 0.0625;
	setAttr ".pv" 0.6875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve6" -p "pSphere2Follicle668";
	rename -uid "47F5DBD4-45BA-A92A-8233-BFAF50D2A2D3";
createNode nurbsCurve -n "curveShape6" -p "curve6";
	rename -uid "3CF5A895-4C9D-527A-873E-D9B49E24DC02";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle680" -p "hairSystem1Follicles";
	rename -uid "E0EFDAFF-4457-A4F0-C926-44BE03A03174";
createNode follicle -n "pSphere2FollicleShape680" -p "pSphere2Follicle680";
	rename -uid "291AD828-46CF-7594-C2FA-0E8FEEC5A476";
	setAttr -k off ".v";
	setAttr ".pu" 0.0625;
	setAttr ".pv" 0.8125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve7" -p "pSphere2Follicle680";
	rename -uid "3E1FFECB-4A67-3298-43C3-68A0B15C93F2";
createNode nurbsCurve -n "curveShape7" -p "curve7";
	rename -uid "A570C862-42FA-087F-6B6D-4CAD8DA7CD7C";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle693" -p "hairSystem1Follicles";
	rename -uid "FC1CB4D0-4A58-F27C-DE0C-41A7C0218CC3";
createNode follicle -n "pSphere2FollicleShape693" -p "pSphere2Follicle693";
	rename -uid "F885247F-454E-EF75-73C6-029BF7BA50A1";
	setAttr -k off ".v";
	setAttr ".pu" 0.0625;
	setAttr ".pv" 0.9375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve8" -p "pSphere2Follicle693";
	rename -uid "9A62920C-4FF2-0348-02C5-BAAF47DE3C9B";
createNode nurbsCurve -n "curveShape8" -p "curve8";
	rename -uid "CF5C5319-466C-779A-CD92-E7ADCB8D5C56";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle1906" -p "hairSystem1Follicles";
	rename -uid "10458E97-480A-43DC-B24C-7898A75B2143";
createNode follicle -n "pSphere2FollicleShape1906" -p "pSphere2Follicle1906";
	rename -uid "CB95FC2C-4770-7ADB-7064-DEB5ADD601F4";
	setAttr -k off ".v";
	setAttr ".pu" 0.1875;
	setAttr ".pv" 0.0625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve9" -p "pSphere2Follicle1906";
	rename -uid "0D5A97B6-469C-2E8F-BBB2-F79F10769123";
createNode nurbsCurve -n "curveShape9" -p "curve9";
	rename -uid "C70F1A07-435C-B87A-34E8-2A808F4B3C28";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle1919" -p "hairSystem1Follicles";
	rename -uid "AEFF058F-4F60-9E90-CB8E-4F926DCFEAF2";
createNode follicle -n "pSphere2FollicleShape1919" -p "pSphere2Follicle1919";
	rename -uid "962FFEAC-4A55-F117-FF3F-C4B9916BCB8F";
	setAttr -k off ".v";
	setAttr ".pu" 0.1875;
	setAttr ".pv" 0.1875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve10" -p "pSphere2Follicle1919";
	rename -uid "36B37F67-4195-7A75-5CC7-BFAEE1017F43";
createNode nurbsCurve -n "curveShape10" -p "curve10";
	rename -uid "A8D38EEA-4E3D-0A26-7B1A-05B9745637A0";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle1931" -p "hairSystem1Follicles";
	rename -uid "F4292730-4D6C-AE0D-2B4E-24962CCA2454";
createNode follicle -n "pSphere2FollicleShape1931" -p "pSphere2Follicle1931";
	rename -uid "61927E39-4636-E5DA-72BA-6FBFB18A6439";
	setAttr -k off ".v";
	setAttr ".pu" 0.1875;
	setAttr ".pv" 0.3125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve11" -p "pSphere2Follicle1931";
	rename -uid "8C192343-409A-8EEB-2215-66B7BE06BFBC";
createNode nurbsCurve -n "curveShape11" -p "curve11";
	rename -uid "95B43268-4E38-B0EE-E93E-E1BA782C0B64";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle1943" -p "hairSystem1Follicles";
	rename -uid "1387F056-4367-0F4A-200C-2D9CF7144D96";
createNode follicle -n "pSphere2FollicleShape1943" -p "pSphere2Follicle1943";
	rename -uid "E83E652F-4830-F08B-60E6-C78DFDDDF91D";
	setAttr -k off ".v";
	setAttr ".pu" 0.1875;
	setAttr ".pv" 0.4375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve12" -p "pSphere2Follicle1943";
	rename -uid "0E29CC91-4141-829E-A5CF-32890B4D4794";
createNode nurbsCurve -n "curveShape12" -p "curve12";
	rename -uid "5C978BAA-4781-9C5E-D79A-77904C3FE7D1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle1956" -p "hairSystem1Follicles";
	rename -uid "2C2942D4-4799-A5B9-0212-A6A71363448B";
createNode follicle -n "pSphere2FollicleShape1956" -p "pSphere2Follicle1956";
	rename -uid "D08B66F9-4112-B521-3668-18A23F79DED4";
	setAttr -k off ".v";
	setAttr ".pu" 0.1875;
	setAttr ".pv" 0.5625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve13" -p "pSphere2Follicle1956";
	rename -uid "112718C3-4E61-8E7C-222C-9486AAE42106";
createNode nurbsCurve -n "curveShape13" -p "curve13";
	rename -uid "D9277493-4322-87A0-4383-47AF0D3F1882";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle1968" -p "hairSystem1Follicles";
	rename -uid "B4140359-41F7-301C-C36C-F89003E3DE8D";
createNode follicle -n "pSphere2FollicleShape1968" -p "pSphere2Follicle1968";
	rename -uid "34BC8C0C-4EB8-58CF-3D67-AEB56859567E";
	setAttr -k off ".v";
	setAttr ".pu" 0.1875;
	setAttr ".pv" 0.6875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve14" -p "pSphere2Follicle1968";
	rename -uid "F0EC7DF6-4BAC-415B-37B4-7DBB29F741F1";
createNode nurbsCurve -n "curveShape14" -p "curve14";
	rename -uid "2ED42E64-460B-97BC-CB5F-6EA9CA94059E";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle1980" -p "hairSystem1Follicles";
	rename -uid "2FE240C2-471A-3D7E-54D7-FC8F0294CC0F";
createNode follicle -n "pSphere2FollicleShape1980" -p "pSphere2Follicle1980";
	rename -uid "DCA7BABF-4C81-997A-306B-FA98A2D03BAA";
	setAttr -k off ".v";
	setAttr ".pu" 0.1875;
	setAttr ".pv" 0.8125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve15" -p "pSphere2Follicle1980";
	rename -uid "7BD17FAB-4A2B-DE58-4F13-65B7A72ACDA8";
createNode nurbsCurve -n "curveShape15" -p "curve15";
	rename -uid "E6C32ABA-4BDF-037D-4116-55BF381CA726";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle1993" -p "hairSystem1Follicles";
	rename -uid "87B22E7F-41C8-199E-4288-BD9B07E9D862";
createNode follicle -n "pSphere2FollicleShape1993" -p "pSphere2Follicle1993";
	rename -uid "CF169F95-4BD5-7515-A53F-A7A03941DA80";
	setAttr -k off ".v";
	setAttr ".pu" 0.1875;
	setAttr ".pv" 0.9375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve16" -p "pSphere2Follicle1993";
	rename -uid "100A056C-4520-F18B-8433-89A7027631CB";
createNode nurbsCurve -n "curveShape16" -p "curve16";
	rename -uid "F7106008-48B2-7FAB-7564-8296D0C3B685";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle3106" -p "hairSystem1Follicles";
	rename -uid "9B8AE626-4BEA-AC34-CC36-CB8125ED2642";
createNode follicle -n "pSphere2FollicleShape3106" -p "pSphere2Follicle3106";
	rename -uid "ABB55EF0-46CE-0D92-7B33-64BCADB4FB8B";
	setAttr -k off ".v";
	setAttr ".pu" 0.3125;
	setAttr ".pv" 0.0625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve17" -p "pSphere2Follicle3106";
	rename -uid "C34F96C4-44C3-015C-AD07-C9BB11FD7DEF";
createNode nurbsCurve -n "curveShape17" -p "curve17";
	rename -uid "0B1E8484-4EED-AF1F-5FB6-3A979E874A9A";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle3119" -p "hairSystem1Follicles";
	rename -uid "6943DBF7-4D2D-7FE2-23D0-D5BAC47295B7";
createNode follicle -n "pSphere2FollicleShape3119" -p "pSphere2Follicle3119";
	rename -uid "4990DEA9-4F33-49BC-CCFC-80A437D4F1F3";
	setAttr -k off ".v";
	setAttr ".pu" 0.3125;
	setAttr ".pv" 0.1875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve18" -p "pSphere2Follicle3119";
	rename -uid "54FCF624-4C80-482B-4ADE-91A972C7BC51";
createNode nurbsCurve -n "curveShape18" -p "curve18";
	rename -uid "B54D3F38-4269-DF83-766D-839E9BD208C6";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle3131" -p "hairSystem1Follicles";
	rename -uid "D125F8FF-4689-DDA6-C44E-529D09219DE3";
createNode follicle -n "pSphere2FollicleShape3131" -p "pSphere2Follicle3131";
	rename -uid "3796F5A0-4270-909E-2032-5D839E511D5B";
	setAttr -k off ".v";
	setAttr ".pu" 0.3125;
	setAttr ".pv" 0.3125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve19" -p "pSphere2Follicle3131";
	rename -uid "781862B7-4FE1-FFFE-1972-51AF64C32561";
createNode nurbsCurve -n "curveShape19" -p "curve19";
	rename -uid "484CBB7E-4CCD-442F-0E13-09BB166E7479";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle3143" -p "hairSystem1Follicles";
	rename -uid "87DB4EC7-407E-24A7-8449-3B8833A874C6";
createNode follicle -n "pSphere2FollicleShape3143" -p "pSphere2Follicle3143";
	rename -uid "6815B68E-4AB1-631D-AF81-388CCCFB3341";
	setAttr -k off ".v";
	setAttr ".pu" 0.3125;
	setAttr ".pv" 0.4375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve20" -p "pSphere2Follicle3143";
	rename -uid "BEAA7BA2-4BD2-70E6-5221-7DB774C929DE";
createNode nurbsCurve -n "curveShape20" -p "curve20";
	rename -uid "E98E46FC-4E3B-D53F-4715-72BD74C107BA";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle3156" -p "hairSystem1Follicles";
	rename -uid "6D51A670-469C-FA88-EC0A-B298261A0CAE";
createNode follicle -n "pSphere2FollicleShape3156" -p "pSphere2Follicle3156";
	rename -uid "963945C6-420C-617B-B4FD-F79A0726AF84";
	setAttr -k off ".v";
	setAttr ".pu" 0.3125;
	setAttr ".pv" 0.5625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve21" -p "pSphere2Follicle3156";
	rename -uid "8F94E3BF-48DD-1F1E-7B1B-9EA8E0C30C78";
createNode nurbsCurve -n "curveShape21" -p "curve21";
	rename -uid "B92C112F-4329-FA9E-268D-00A288F0F67D";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle3168" -p "hairSystem1Follicles";
	rename -uid "A382D356-4CFA-50E9-F303-82876EDE71D4";
createNode follicle -n "pSphere2FollicleShape3168" -p "pSphere2Follicle3168";
	rename -uid "7CA0039F-4AE0-C80A-5033-479A23F2F55D";
	setAttr -k off ".v";
	setAttr ".pu" 0.3125;
	setAttr ".pv" 0.6875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve22" -p "pSphere2Follicle3168";
	rename -uid "1BB70E1F-4C26-76B5-5EBB-8F8B3C00DC9D";
createNode nurbsCurve -n "curveShape22" -p "curve22";
	rename -uid "D21A3D6E-410E-7EDC-53F7-029F0086F74F";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle3180" -p "hairSystem1Follicles";
	rename -uid "5BB64A5D-49E1-3ED9-2049-66B0B02C9928";
createNode follicle -n "pSphere2FollicleShape3180" -p "pSphere2Follicle3180";
	rename -uid "6FE9DD66-4463-AB9C-B966-86B17C9B0DDA";
	setAttr -k off ".v";
	setAttr ".pu" 0.3125;
	setAttr ".pv" 0.8125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve23" -p "pSphere2Follicle3180";
	rename -uid "6FF39E94-4D12-1C7E-3A2B-5F92FE880EE8";
createNode nurbsCurve -n "curveShape23" -p "curve23";
	rename -uid "765D67AD-4A72-CB00-2A77-62B6FDC8DDB9";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle3193" -p "hairSystem1Follicles";
	rename -uid "434798A6-455B-1F3E-DEE4-B9884FE13C56";
createNode follicle -n "pSphere2FollicleShape3193" -p "pSphere2Follicle3193";
	rename -uid "CE8350BD-4F1F-F88E-9127-BCB878805B84";
	setAttr -k off ".v";
	setAttr ".pu" 0.3125;
	setAttr ".pv" 0.9375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve24" -p "pSphere2Follicle3193";
	rename -uid "3E5A0D11-49ED-13FF-B7F7-18981421A255";
createNode nurbsCurve -n "curveShape24" -p "curve24";
	rename -uid "BA1FA386-4DB1-B67C-6EF1-138EB8586B87";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle4306" -p "hairSystem1Follicles";
	rename -uid "7B8C7AF8-4882-E652-D8B9-A69382F5677A";
createNode follicle -n "pSphere2FollicleShape4306" -p "pSphere2Follicle4306";
	rename -uid "22D0B225-4437-2D41-938E-798AB79A1ED3";
	setAttr -k off ".v";
	setAttr ".pu" 0.4375;
	setAttr ".pv" 0.0625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve25" -p "pSphere2Follicle4306";
	rename -uid "06D3AB83-46B6-9510-A0F2-B8B776C216A2";
createNode nurbsCurve -n "curveShape25" -p "curve25";
	rename -uid "9F67FB2E-452A-087A-D899-EBA7C9403CDA";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle4319" -p "hairSystem1Follicles";
	rename -uid "81AECF18-4737-1806-1AE0-30A7DA8E2A27";
createNode follicle -n "pSphere2FollicleShape4319" -p "pSphere2Follicle4319";
	rename -uid "346A9DB1-42A2-D11D-2B23-EEAD855DAF93";
	setAttr -k off ".v";
	setAttr ".pu" 0.4375;
	setAttr ".pv" 0.1875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve26" -p "pSphere2Follicle4319";
	rename -uid "31F1CDEB-4A06-C43B-93B3-ADB4669C996A";
createNode nurbsCurve -n "curveShape26" -p "curve26";
	rename -uid "1F76B7FC-44E2-FC48-2FBB-0BA653454D5F";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle4331" -p "hairSystem1Follicles";
	rename -uid "0DE3A50A-4F22-2C1D-8739-408F5D47831F";
createNode follicle -n "pSphere2FollicleShape4331" -p "pSphere2Follicle4331";
	rename -uid "FE6CEE4B-4EBD-F12E-EA88-988548FC4D43";
	setAttr -k off ".v";
	setAttr ".pu" 0.4375;
	setAttr ".pv" 0.3125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve27" -p "pSphere2Follicle4331";
	rename -uid "425525BB-49E7-B53F-F9F4-8197EF6E1D58";
createNode nurbsCurve -n "curveShape27" -p "curve27";
	rename -uid "CF809305-4741-1717-CD74-94B1636C45FE";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle4343" -p "hairSystem1Follicles";
	rename -uid "24E8BF6C-4E90-28F6-723B-58B699CCDC92";
createNode follicle -n "pSphere2FollicleShape4343" -p "pSphere2Follicle4343";
	rename -uid "19A8DD37-4009-5012-1E96-1791E49F636A";
	setAttr -k off ".v";
	setAttr ".pu" 0.4375;
	setAttr ".pv" 0.4375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve28" -p "pSphere2Follicle4343";
	rename -uid "00B79E54-42A0-223A-5BF8-1C8D224D6728";
createNode nurbsCurve -n "curveShape28" -p "curve28";
	rename -uid "84F8AE7B-4818-63AA-8798-9FBC1F26F4BB";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle4356" -p "hairSystem1Follicles";
	rename -uid "47BCF6E9-4086-DBAD-EB5C-BBA8A316D83B";
createNode follicle -n "pSphere2FollicleShape4356" -p "pSphere2Follicle4356";
	rename -uid "BB6E4D3E-43E3-8A09-A92D-78B4116AF2D4";
	setAttr -k off ".v";
	setAttr ".pu" 0.4375;
	setAttr ".pv" 0.5625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve29" -p "pSphere2Follicle4356";
	rename -uid "78CA81A4-4030-41FB-542B-75B25022C89A";
createNode nurbsCurve -n "curveShape29" -p "curve29";
	rename -uid "CD68ECFE-4DB2-D57C-63CC-F1BC1FCCF9A0";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle4368" -p "hairSystem1Follicles";
	rename -uid "F0AECF15-4932-CEBA-15E5-989518F66151";
createNode follicle -n "pSphere2FollicleShape4368" -p "pSphere2Follicle4368";
	rename -uid "0F54EDE2-4A6F-3F93-A582-C0AFA4CF8BFD";
	setAttr -k off ".v";
	setAttr ".pu" 0.4375;
	setAttr ".pv" 0.6875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve30" -p "pSphere2Follicle4368";
	rename -uid "D58D8081-4746-1686-6191-6896329A1FB0";
createNode nurbsCurve -n "curveShape30" -p "curve30";
	rename -uid "769C2641-43F9-5A48-515A-D381B1C5BC67";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle4380" -p "hairSystem1Follicles";
	rename -uid "C243370C-4E3A-E5B1-CC3B-CC89E1D566E1";
createNode follicle -n "pSphere2FollicleShape4380" -p "pSphere2Follicle4380";
	rename -uid "10921E4D-4FD7-116E-270B-BB90AD9712E5";
	setAttr -k off ".v";
	setAttr ".pu" 0.4375;
	setAttr ".pv" 0.8125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve31" -p "pSphere2Follicle4380";
	rename -uid "BCC5AA7A-4CC8-93C1-4482-D18D11AABDE2";
createNode nurbsCurve -n "curveShape31" -p "curve31";
	rename -uid "368B4D49-447E-310D-FFB4-129686835463";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle4393" -p "hairSystem1Follicles";
	rename -uid "D3EBD9F4-40AD-6D3B-2108-AB9A6BD1383D";
createNode follicle -n "pSphere2FollicleShape4393" -p "pSphere2Follicle4393";
	rename -uid "897C5F90-4065-1EA9-9BE8-D98967048EA4";
	setAttr -k off ".v";
	setAttr ".pu" 0.4375;
	setAttr ".pv" 0.9375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve32" -p "pSphere2Follicle4393";
	rename -uid "3862D7BF-4DF8-B752-CDDA-628B18A3E3B2";
createNode nurbsCurve -n "curveShape32" -p "curve32";
	rename -uid "F5F80FD6-4591-BD63-7750-9A9FCEE9EA2C";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle5606" -p "hairSystem1Follicles";
	rename -uid "468A0971-4E88-72AB-7A49-CA96AEAF2C38";
createNode follicle -n "pSphere2FollicleShape5606" -p "pSphere2Follicle5606";
	rename -uid "4976838F-4405-D7DF-822A-41BB238B70F5";
	setAttr -k off ".v";
	setAttr ".pu" 0.5625;
	setAttr ".pv" 0.0625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve33" -p "pSphere2Follicle5606";
	rename -uid "E9F7C856-452A-B15E-F42D-DE93F0BF7747";
createNode nurbsCurve -n "curveShape33" -p "curve33";
	rename -uid "8DBA9287-43F8-5570-1701-64BD9DC23080";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle5619" -p "hairSystem1Follicles";
	rename -uid "8BA6AE62-4EE5-D01C-6FF9-3794500A39B3";
createNode follicle -n "pSphere2FollicleShape5619" -p "pSphere2Follicle5619";
	rename -uid "A0BD1376-4FF0-897F-C492-25B1B5F1B4AA";
	setAttr -k off ".v";
	setAttr ".pu" 0.5625;
	setAttr ".pv" 0.1875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve34" -p "pSphere2Follicle5619";
	rename -uid "2739C295-41F3-7A55-3236-1CA948C74245";
createNode nurbsCurve -n "curveShape34" -p "curve34";
	rename -uid "DCA70A42-4304-FEA9-6F81-4B852580560D";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle5631" -p "hairSystem1Follicles";
	rename -uid "A8FA015D-4A41-38ED-5CC5-5BB7D9FE149E";
createNode follicle -n "pSphere2FollicleShape5631" -p "pSphere2Follicle5631";
	rename -uid "16A9CAED-4831-36F5-06EB-0CBA8EECFFD9";
	setAttr -k off ".v";
	setAttr ".pu" 0.5625;
	setAttr ".pv" 0.3125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve35" -p "pSphere2Follicle5631";
	rename -uid "8D049540-49F7-2334-88C1-31B795A92214";
createNode nurbsCurve -n "curveShape35" -p "curve35";
	rename -uid "A1EB43FD-40CB-C5C1-5B1F-49BD3C866EF0";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle5643" -p "hairSystem1Follicles";
	rename -uid "93E6DC33-40E5-A4C7-E639-CE91EAA25943";
createNode follicle -n "pSphere2FollicleShape5643" -p "pSphere2Follicle5643";
	rename -uid "F0375B39-48B3-39D8-4E02-27A9F5CAD795";
	setAttr -k off ".v";
	setAttr ".pu" 0.5625;
	setAttr ".pv" 0.4375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve36" -p "pSphere2Follicle5643";
	rename -uid "1607B357-4866-6116-E319-108ABB269B77";
createNode nurbsCurve -n "curveShape36" -p "curve36";
	rename -uid "C56498AC-43B6-2019-5D5C-029A760C051C";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle5656" -p "hairSystem1Follicles";
	rename -uid "2F288B7D-404F-DDD6-8663-E2A8DD0E8B0C";
createNode follicle -n "pSphere2FollicleShape5656" -p "pSphere2Follicle5656";
	rename -uid "6012FC5C-4645-DA57-1CE9-ED94134EE70F";
	setAttr -k off ".v";
	setAttr ".pu" 0.5625;
	setAttr ".pv" 0.5625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve37" -p "pSphere2Follicle5656";
	rename -uid "5314F376-438C-8368-6CC9-83A4D99CA1A7";
createNode nurbsCurve -n "curveShape37" -p "curve37";
	rename -uid "8E572886-4E53-52EF-AA5B-F59849EFB707";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle5668" -p "hairSystem1Follicles";
	rename -uid "0D97621B-4F7C-4DE2-581B-329A80536911";
createNode follicle -n "pSphere2FollicleShape5668" -p "pSphere2Follicle5668";
	rename -uid "F8D2E232-48F9-B9F0-BD25-0CAD385B0526";
	setAttr -k off ".v";
	setAttr ".pu" 0.5625;
	setAttr ".pv" 0.6875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve38" -p "pSphere2Follicle5668";
	rename -uid "F38B1D32-4D51-E5E3-2543-2998A78746D7";
createNode nurbsCurve -n "curveShape38" -p "curve38";
	rename -uid "2D7FA3B6-4792-CB7F-6B99-F18BA3D1AB44";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle5680" -p "hairSystem1Follicles";
	rename -uid "633561FC-4DBA-2413-2271-4BA284172DBC";
createNode follicle -n "pSphere2FollicleShape5680" -p "pSphere2Follicle5680";
	rename -uid "3FFBA199-487B-C5EE-F021-53A69E20AC96";
	setAttr -k off ".v";
	setAttr ".pu" 0.5625;
	setAttr ".pv" 0.8125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve39" -p "pSphere2Follicle5680";
	rename -uid "4EE7B2C1-415A-3D78-38DF-9D8C7B56A45D";
createNode nurbsCurve -n "curveShape39" -p "curve39";
	rename -uid "C7BAC30D-4665-4C07-C18E-7287635DE759";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle5693" -p "hairSystem1Follicles";
	rename -uid "E680DDBB-4686-5FFB-72D7-5496B9195802";
createNode follicle -n "pSphere2FollicleShape5693" -p "pSphere2Follicle5693";
	rename -uid "3E6F310E-4216-490A-15E8-16B4ED919073";
	setAttr -k off ".v";
	setAttr ".pu" 0.5625;
	setAttr ".pv" 0.9375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve40" -p "pSphere2Follicle5693";
	rename -uid "7FCD07F1-4D75-F786-2AAF-4BBFD08E762A";
createNode nurbsCurve -n "curveShape40" -p "curve40";
	rename -uid "54B829EE-46B6-6C2A-4082-DABF4863A255";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle6806" -p "hairSystem1Follicles";
	rename -uid "09D9814B-4E5B-5B91-E8AA-C2B37DA7AAD7";
createNode follicle -n "pSphere2FollicleShape6806" -p "pSphere2Follicle6806";
	rename -uid "CE12C866-41A4-B978-F275-0088ED0E5C7C";
	setAttr -k off ".v";
	setAttr ".pu" 0.6875;
	setAttr ".pv" 0.0625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve41" -p "pSphere2Follicle6806";
	rename -uid "0D956B6B-4089-FE73-93AC-62AF1F81926F";
createNode nurbsCurve -n "curveShape41" -p "curve41";
	rename -uid "DC0CAFC4-4A7B-5B8E-9C46-F6921B8714C3";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle6819" -p "hairSystem1Follicles";
	rename -uid "E7CE7AF9-4A0E-AB65-91A8-19952218070E";
createNode follicle -n "pSphere2FollicleShape6819" -p "pSphere2Follicle6819";
	rename -uid "C7AD3A20-43BC-C17D-E3A4-10BC93C16C09";
	setAttr -k off ".v";
	setAttr ".pu" 0.6875;
	setAttr ".pv" 0.1875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve42" -p "pSphere2Follicle6819";
	rename -uid "9C6D8B1D-4E28-E597-6084-A8954EFFF588";
createNode nurbsCurve -n "curveShape42" -p "curve42";
	rename -uid "DE3501A0-4127-666F-617D-D2937D1718EB";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle6831" -p "hairSystem1Follicles";
	rename -uid "C4E2BCB3-441E-DCA6-40D2-4299C376C570";
createNode follicle -n "pSphere2FollicleShape6831" -p "pSphere2Follicle6831";
	rename -uid "802B627A-49AB-8E13-550C-99BB0FBFF951";
	setAttr -k off ".v";
	setAttr ".pu" 0.6875;
	setAttr ".pv" 0.3125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve43" -p "pSphere2Follicle6831";
	rename -uid "70E021DC-45EF-57DA-8738-758614FCBF91";
createNode nurbsCurve -n "curveShape43" -p "curve43";
	rename -uid "A05B6536-4159-18AC-0EE4-86B37829B514";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle6843" -p "hairSystem1Follicles";
	rename -uid "6EC70C5F-4BE4-777E-FB0A-8B877BBEF3B6";
createNode follicle -n "pSphere2FollicleShape6843" -p "pSphere2Follicle6843";
	rename -uid "0348C103-4D0C-EF83-8F4D-B4866A111E61";
	setAttr -k off ".v";
	setAttr ".pu" 0.6875;
	setAttr ".pv" 0.4375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve44" -p "pSphere2Follicle6843";
	rename -uid "59974C67-4058-0B9D-61A3-B6961C2195B1";
createNode nurbsCurve -n "curveShape44" -p "curve44";
	rename -uid "1662477B-4F00-AE8C-193E-CC84FD2ED32B";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle6856" -p "hairSystem1Follicles";
	rename -uid "605AC060-4B4C-C3AC-C7B7-F79836EF5CBB";
createNode follicle -n "pSphere2FollicleShape6856" -p "pSphere2Follicle6856";
	rename -uid "BB75C8DF-48A0-1F3F-5605-CA907C52877F";
	setAttr -k off ".v";
	setAttr ".pu" 0.6875;
	setAttr ".pv" 0.5625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve45" -p "pSphere2Follicle6856";
	rename -uid "B641455A-4522-DC7F-5CDB-8ABE6B1D4407";
createNode nurbsCurve -n "curveShape45" -p "curve45";
	rename -uid "D8957748-456D-2D0F-8DFC-54A4D13E70B9";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle6868" -p "hairSystem1Follicles";
	rename -uid "F475E60A-42E3-2824-F6CF-B6A7AF5A96C9";
createNode follicle -n "pSphere2FollicleShape6868" -p "pSphere2Follicle6868";
	rename -uid "6B342E81-46EF-F83E-6D0D-A090AF3203E8";
	setAttr -k off ".v";
	setAttr ".pu" 0.6875;
	setAttr ".pv" 0.6875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve46" -p "pSphere2Follicle6868";
	rename -uid "F78E723C-46D5-9801-04DF-E0993172FB96";
createNode nurbsCurve -n "curveShape46" -p "curve46";
	rename -uid "E9809E8B-48B5-6C1C-602E-00B8AC5C7230";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle6880" -p "hairSystem1Follicles";
	rename -uid "76CD1F25-4FA5-82AB-4DE6-EFA318FD03D9";
createNode follicle -n "pSphere2FollicleShape6880" -p "pSphere2Follicle6880";
	rename -uid "4EE2D2F8-40B3-8415-9031-B2B50EB38FE7";
	setAttr -k off ".v";
	setAttr ".pu" 0.6875;
	setAttr ".pv" 0.8125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve47" -p "pSphere2Follicle6880";
	rename -uid "0B0FE086-48C4-9A95-D73B-39BC849F0D99";
createNode nurbsCurve -n "curveShape47" -p "curve47";
	rename -uid "DC985307-40FC-BBC7-A219-68A785E520A5";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle6893" -p "hairSystem1Follicles";
	rename -uid "5493075D-43CB-B807-A319-A78729C2AA7B";
createNode follicle -n "pSphere2FollicleShape6893" -p "pSphere2Follicle6893";
	rename -uid "80C2FE7B-47A3-EDE4-9CD4-C3BAF5D9859A";
	setAttr -k off ".v";
	setAttr ".pu" 0.6875;
	setAttr ".pv" 0.9375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve48" -p "pSphere2Follicle6893";
	rename -uid "AE9F1E31-4570-6E3C-C694-3F845EB867A7";
createNode nurbsCurve -n "curveShape48" -p "curve48";
	rename -uid "F7496455-4C1B-F3C6-634A-579A58AFED64";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle8006" -p "hairSystem1Follicles";
	rename -uid "40EAE56D-4535-295A-DF0D-EE98BE75A7C6";
createNode follicle -n "pSphere2FollicleShape8006" -p "pSphere2Follicle8006";
	rename -uid "AF0621B2-40B1-3F22-4299-64A6D98151AB";
	setAttr -k off ".v";
	setAttr ".pu" 0.8125;
	setAttr ".pv" 0.0625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve49" -p "pSphere2Follicle8006";
	rename -uid "370187CA-4453-A447-F587-238AF8C4645E";
createNode nurbsCurve -n "curveShape49" -p "curve49";
	rename -uid "112181A6-4551-F3BF-8F94-DD814B83A60C";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle8019" -p "hairSystem1Follicles";
	rename -uid "AFD9444B-48A2-930B-813B-C390C7CD5437";
createNode follicle -n "pSphere2FollicleShape8019" -p "pSphere2Follicle8019";
	rename -uid "A57807FB-4590-5640-E57E-558165FCEA8D";
	setAttr -k off ".v";
	setAttr ".pu" 0.8125;
	setAttr ".pv" 0.1875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve50" -p "pSphere2Follicle8019";
	rename -uid "7A906CB1-4393-E6D0-3D8B-B2A5AEB08AD2";
createNode nurbsCurve -n "curveShape50" -p "curve50";
	rename -uid "003DF513-4D1B-36D2-B6AC-3094533E07CE";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle8031" -p "hairSystem1Follicles";
	rename -uid "2282EC40-4E03-6950-7CF4-D1B584BC752C";
createNode follicle -n "pSphere2FollicleShape8031" -p "pSphere2Follicle8031";
	rename -uid "C3AE4557-471E-BB1D-76BE-64AF0580788B";
	setAttr -k off ".v";
	setAttr ".pu" 0.8125;
	setAttr ".pv" 0.3125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve51" -p "pSphere2Follicle8031";
	rename -uid "C0AC3B97-4C99-1635-E488-2A9A4B28CC18";
createNode nurbsCurve -n "curveShape51" -p "curve51";
	rename -uid "38A04D08-4455-45B1-0319-87B2DEF60BB7";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle8043" -p "hairSystem1Follicles";
	rename -uid "E35F969C-4F52-BD7F-C1FD-53B0BEB81B38";
createNode follicle -n "pSphere2FollicleShape8043" -p "pSphere2Follicle8043";
	rename -uid "D378C363-4BDE-41E6-F5BC-8E98EDCC5C74";
	setAttr -k off ".v";
	setAttr ".pu" 0.8125;
	setAttr ".pv" 0.4375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve52" -p "pSphere2Follicle8043";
	rename -uid "348E7D9D-42A4-F0E9-5D09-9C80EE3097BE";
createNode nurbsCurve -n "curveShape52" -p "curve52";
	rename -uid "22E8C262-4F24-6E1F-170F-D89B0F4E3892";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle8056" -p "hairSystem1Follicles";
	rename -uid "00D0E348-498A-2D21-310D-9EA33B6F875E";
createNode follicle -n "pSphere2FollicleShape8056" -p "pSphere2Follicle8056";
	rename -uid "D816375C-4AEB-81E6-D487-6EA97D8EC74E";
	setAttr -k off ".v";
	setAttr ".pu" 0.8125;
	setAttr ".pv" 0.5625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve53" -p "pSphere2Follicle8056";
	rename -uid "D49A89B8-4CFB-621A-9DD3-65BE5D378845";
createNode nurbsCurve -n "curveShape53" -p "curve53";
	rename -uid "1DB51005-46DF-DB36-9922-FBBC16442D73";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle8068" -p "hairSystem1Follicles";
	rename -uid "1F849B54-4715-1A67-D371-03A3F978E1EC";
createNode follicle -n "pSphere2FollicleShape8068" -p "pSphere2Follicle8068";
	rename -uid "FE4045BC-4C75-0171-9D79-92B1B76C6319";
	setAttr -k off ".v";
	setAttr ".pu" 0.8125;
	setAttr ".pv" 0.6875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve54" -p "pSphere2Follicle8068";
	rename -uid "A280909A-43CC-8E35-C418-94BA81A836B1";
createNode nurbsCurve -n "curveShape54" -p "curve54";
	rename -uid "29E689C3-4164-4B3F-6D51-36A0FBA81BFB";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle8080" -p "hairSystem1Follicles";
	rename -uid "FA153305-4E8A-04A7-FB5A-198C462F528D";
createNode follicle -n "pSphere2FollicleShape8080" -p "pSphere2Follicle8080";
	rename -uid "14602A67-41CC-281C-7261-54AFC690EDD2";
	setAttr -k off ".v";
	setAttr ".pu" 0.8125;
	setAttr ".pv" 0.8125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve55" -p "pSphere2Follicle8080";
	rename -uid "986A4F1C-407D-777F-2CA9-E2BD3F4314B5";
createNode nurbsCurve -n "curveShape55" -p "curve55";
	rename -uid "687C8AAB-4812-DC4C-1B07-39988593593D";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle8093" -p "hairSystem1Follicles";
	rename -uid "86969E9F-4A6A-D5A0-4391-3A9CD12E7D20";
createNode follicle -n "pSphere2FollicleShape8093" -p "pSphere2Follicle8093";
	rename -uid "89262612-429B-79F2-5839-6D874B7DF23A";
	setAttr -k off ".v";
	setAttr ".pu" 0.8125;
	setAttr ".pv" 0.9375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve56" -p "pSphere2Follicle8093";
	rename -uid "017F10D0-4E1A-A3F4-21A1-B79034CCA454";
createNode nurbsCurve -n "curveShape56" -p "curve56";
	rename -uid "F7D4A0CB-48FA-2B0F-7899-23827B5E2C34";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle9306" -p "hairSystem1Follicles";
	rename -uid "51F8C9F9-4D9F-BE7E-8C07-25914DA91F5F";
createNode follicle -n "pSphere2FollicleShape9306" -p "pSphere2Follicle9306";
	rename -uid "00F2CD6E-48EE-9B63-BB25-849234FF340D";
	setAttr -k off ".v";
	setAttr ".pu" 0.9375;
	setAttr ".pv" 0.0625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve57" -p "pSphere2Follicle9306";
	rename -uid "FD4A7D31-4643-A66D-BCF7-8E83F7258A35";
createNode nurbsCurve -n "curveShape57" -p "curve57";
	rename -uid "6B66DD17-4BED-0100-7D00-68ADD2390CFD";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle9319" -p "hairSystem1Follicles";
	rename -uid "1E16541A-4A80-9930-C908-9E98CBA3644F";
createNode follicle -n "pSphere2FollicleShape9319" -p "pSphere2Follicle9319";
	rename -uid "685A7ACF-4F00-6AD3-3B7B-BA95EA53B3C2";
	setAttr -k off ".v";
	setAttr ".pu" 0.9375;
	setAttr ".pv" 0.1875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve58" -p "pSphere2Follicle9319";
	rename -uid "5164175D-40E4-39ED-E8B5-FB90FA24F6EF";
createNode nurbsCurve -n "curveShape58" -p "curve58";
	rename -uid "AFAC771E-4E98-AD8F-F33B-AB9C1E9DA0F8";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle9331" -p "hairSystem1Follicles";
	rename -uid "72D0E21B-4F09-31E6-CD58-D5924299CF45";
createNode follicle -n "pSphere2FollicleShape9331" -p "pSphere2Follicle9331";
	rename -uid "5E2CB8D3-4CE5-DA6E-1B63-82822DF1F123";
	setAttr -k off ".v";
	setAttr ".pu" 0.9375;
	setAttr ".pv" 0.3125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve59" -p "pSphere2Follicle9331";
	rename -uid "419D175D-49B7-F44B-4B54-128F6D32D436";
createNode nurbsCurve -n "curveShape59" -p "curve59";
	rename -uid "51236F6D-4E45-9E70-1557-1FA579A21EBC";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle9343" -p "hairSystem1Follicles";
	rename -uid "AC6B37FB-41AF-6148-C069-FE9E88E4EFB0";
createNode follicle -n "pSphere2FollicleShape9343" -p "pSphere2Follicle9343";
	rename -uid "38A9FF5E-45E2-61CF-6F1F-04887D4F4AAD";
	setAttr -k off ".v";
	setAttr ".pu" 0.9375;
	setAttr ".pv" 0.4375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve60" -p "pSphere2Follicle9343";
	rename -uid "6F4B55F8-4A54-670F-A8BE-0BADAC4D5093";
createNode nurbsCurve -n "curveShape60" -p "curve60";
	rename -uid "7958C9FB-41E5-D1CF-4B0C-B9B4C71B75F6";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle9356" -p "hairSystem1Follicles";
	rename -uid "992CEE4B-4256-5A6A-E2B6-F79F6FBBBCA0";
createNode follicle -n "pSphere2FollicleShape9356" -p "pSphere2Follicle9356";
	rename -uid "0EBDFB81-4AEE-29E8-1831-2285445D3990";
	setAttr -k off ".v";
	setAttr ".pu" 0.9375;
	setAttr ".pv" 0.5625;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve61" -p "pSphere2Follicle9356";
	rename -uid "90F5F792-42DF-5ACE-AE9D-56B8BF30A97F";
createNode nurbsCurve -n "curveShape61" -p "curve61";
	rename -uid "62A0F9E4-4277-CBFB-4F9B-91919E0FE395";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle9368" -p "hairSystem1Follicles";
	rename -uid "18B457F8-4C9E-B479-2503-25AEC549CF65";
createNode follicle -n "pSphere2FollicleShape9368" -p "pSphere2Follicle9368";
	rename -uid "3933F7BB-478F-6804-0D10-3FA901497324";
	setAttr -k off ".v";
	setAttr ".pu" 0.9375;
	setAttr ".pv" 0.6875;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve62" -p "pSphere2Follicle9368";
	rename -uid "302BC433-494F-394A-8832-85ADC63FFD2E";
createNode nurbsCurve -n "curveShape62" -p "curve62";
	rename -uid "E7A26DB9-4286-2222-6869-6BAC03675459";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle9380" -p "hairSystem1Follicles";
	rename -uid "F82387A7-4142-5D53-42FB-1D84F4949559";
createNode follicle -n "pSphere2FollicleShape9380" -p "pSphere2Follicle9380";
	rename -uid "0D867F11-4BEE-10AF-2BA2-7E873D45E020";
	setAttr -k off ".v";
	setAttr ".pu" 0.9375;
	setAttr ".pv" 0.8125;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve63" -p "pSphere2Follicle9380";
	rename -uid "C2E9AAFE-454F-F8BE-F015-24B24D62E04D";
createNode nurbsCurve -n "curveShape63" -p "curve63";
	rename -uid "0DFE1CDC-43A0-A773-DEFF-6FA2EB34117B";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pSphere2Follicle9393" -p "hairSystem1Follicles";
	rename -uid "4EF85E5C-47F6-604C-B939-82ACE9985E0A";
createNode follicle -n "pSphere2FollicleShape9393" -p "pSphere2Follicle9393";
	rename -uid "F50FE945-4EAE-6937-17A8-438261731ABF";
	setAttr -k off ".v";
	setAttr ".pu" 0.9375;
	setAttr ".pv" 0.9375;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "curve64" -p "pSphere2Follicle9393";
	rename -uid "A5F8386F-4647-2D31-ECD8-728FFB4650A8";
createNode nurbsCurve -n "curveShape64" -p "curve64";
	rename -uid "71849FAF-4BF7-2AEC-16F1-9781DA89ACBB";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 9 0 no 3
		10 0 1 2 3 4 5 6 7 8 9
		10
		0 0 0
		0 0 0.55555555560000003
		0 0 1.111111111
		0 0 1.6666666670000001
		0 0 2.2222222220000001
		0 0 2.7777777779999999
		0 0 3.3333333330000001
		0 0 3.888888889
		0 0 4.4444444440000002
		0 0 5
		;
createNode transform -n "pfxHair1";
	rename -uid "0B700864-4083-9526-DC49-29B915946263";
createNode pfxHair -n "pfxHairShape1" -p "pfxHair1";
	rename -uid "3F0F0985-4AB2-4729-304A-789A5ACE7854";
	setAttr -k off ".v";
	setAttr ".dpc" 100;
	setAttr ".dam" no;
createNode nucleus -n "nucleus1";
	rename -uid "6E333105-4561-4583-D7BC-C0B5C4C96FDD";
createNode transform -n "group1";
	rename -uid "E37DA2C3-445D-566D-8D65-72B83ACC14E4";
createNode transform -n "pCube2" -p "group1";
	rename -uid "24F7482E-479F-1E1C-14D7-28B734225EF2";
createNode mesh -n "pCubeShape2" -p "pCube2";
	rename -uid "3EFBCB7D-47F7-535C-B403-FAAF58CCE11A";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "group2";
	rename -uid "1D69B0B5-4B0F-0ABB-7A9C-7D8154CE3334";
createNode transform -n "pCylinder1" -p "group2";
	rename -uid "5F5577C0-4289-51F7-0F36-9EA25308B599";
createNode mesh -n "pCylinderShape1" -p "pCylinder1";
	rename -uid "A336A167-4CE7-0DAA-A299-AEB02F2F6ADD";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "group3";
	rename -uid "EDD93F8B-4C3B-B066-5066-729459BB1FB0";
createNode transform -n "pSphere1" -p "group3";
	rename -uid "75BCE87C-4ECB-58CA-20D6-E99A96B4FAC8";
createNode mesh -n "pSphereShape1" -p "pSphere1";
	rename -uid "0BC24F71-410D-13C4-8F9B-40AFBDCF00DB";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "group4";
	rename -uid "17D6A1B4-4BD6-2DB8-50D1-F68116E5990B";
createNode transform -n "pCylinder2" -p "group4";
	rename -uid "01862E12-441F-3EA8-1073-81918C7F68B7";
createNode mesh -n "pCylinderShape2" -p "pCylinder2";
	rename -uid "489C982C-4F1D-BA90-A071-908AAD6F8B99";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "group5";
	rename -uid "305E678C-4D69-9F4E-CEA8-E6A7876BD046";
createNode transform -n "pCube1" -p "group5";
	rename -uid "361C656C-4A18-F5E0-9F5C-429073E376C1";
createNode mesh -n "pCubeShape1" -p "pCube1";
	rename -uid "3AD801CC-49EA-12C6-B48F-81BAC3F929B0";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "65AB334B-4E9A-BFD0-12AF-58A4DA3113B3";
	setAttr -s 3 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "7FB85450-4158-783A-BDB0-F19C5D3467E2";
createNode displayLayer -n "defaultLayer";
	rename -uid "C5FAB8F1-42F5-82EE-8784-219DAEE586C2";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "5F9429BE-4206-5757-02F2-7DA92AC22E04";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "74A288E5-428F-D7EA-BFBE-B38759AA7958";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "AD8D6762-41DB-98EB-A57A-FBA496511B77";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "B2D8B16A-472A-9972-8164-6E8CFB53981B";
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "736E9E0C-4DF0-0F58-DFE5-888EF2D44197";
	setAttr ".version" -type "string" "5.2.0";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "500736D4-4742-1427-B74E-448D2A9BF5EF";
	setAttr ".ai_translator" -type "string" "gaussian";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "74477B03-4E14-6C27-1895-C1BB5C17788E";
	setAttr ".ai_translator" -type "string" "exr";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "27DB6BA6-4995-BC05-CCDC-1A98DCE4EA29";
	setAttr ".output_mode" 0;
	setAttr ".ai_translator" -type "string" "maya";
createNode polyCylinder -n "polyCylinder1";
	rename -uid "2C7A89B2-44AF-1000-6FC7-5D8699D513B3";
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyCube -n "polyCube1";
	rename -uid "0DD39DC8-41FF-BB61-FDEC-FF83D60171EE";
	setAttr ".cuv" 4;
createNode polyCube -n "polyCube2";
	rename -uid "A2AAD608-4C91-D5B8-979C-79AD9C054438";
	setAttr ".cuv" 4;
createNode polySphere -n "polySphere1";
	rename -uid "02937766-47FA-3ACC-A9BF-90A12B388063";
createNode polySphere -n "polySphere2";
	rename -uid "ACE5841A-4785-EC81-8FE6-9E9BCA8B3F83";
createNode polyCylinder -n "polyCylinder2";
	rename -uid "D726AE60-4AF8-8FA0-A238-02830978BEF3";
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode makeNurbsSquare -n "makeNurbsSquare1";
	rename -uid "2E3A3440-4499-C076-5848-D9B1E9E91E24";
	setAttr ".nr" -type "double3" 0 1 0 ;
createNode makeNurbCircle -n "makeNurbCircle1";
	rename -uid "33E458F2-4F78-42FA-7E0E-689E8444478E";
	setAttr ".nr" -type "double3" 0 1 0 ;
createNode makeNurbsSquare -n "makeNurbsSquare2";
	rename -uid "B57E439F-480D-F3B5-50AC-45B44C9BD3C0";
	setAttr ".nr" -type "double3" 0 1 0 ;
createNode makeNurbCircle -n "makeNurbCircle2";
	rename -uid "D7F60A3A-4F6B-145A-FAA3-3CA79754036D";
	setAttr ".nr" -type "double3" 0 1 0 ;
createNode makeNurbSphere -n "makeNurbSphere1";
	rename -uid "31D7BFC6-4F16-48E9-4F1E-518D65FF3E28";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode makeNurbCube -n "makeNurbCube1";
	rename -uid "BEEEEA51-4529-A644-567E-D88FEFE7C3DA";
	setAttr ".ax" -type "double3" 0 1 0 ;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "C5D0273B-4A64-97C9-E832-7D9AA7E7ECAF";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|nurbsSquare1|leftnurbsSquare1|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n"
		+ "            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n"
		+ "            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n"
		+ "            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n"
		+ "            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n"
		+ "            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 0\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n"
		+ "            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 734\n            -height 863\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n"
		+ "            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 0\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 1\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n"
		+ "            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            -ufeFilter \"USD\" \"InactivePrims\" -ufeFilterValue 1\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n"
		+ "            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n"
		+ "            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -ufeFilter \"USD\" \"InactivePrims\" -ufeFilterValue 1\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n"
		+ "                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n"
		+ "                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n"
		+ "                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n"
		+ "                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n"
		+ "                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n"
		+ "                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n"
		+ "                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"|persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n"
		+ "                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n"
		+ "                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -bluePencil 1\n                -greasePencils 0\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n"
		+ "        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 0\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 734\\n    -height 863\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 0\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 734\\n    -height 863\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "5E5BF0DB-48E8-1C39-30BD-149B2816721C";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :lightList1;
	setAttr -s 7 ".l";
select -ne :initialShadingGroup;
	setAttr -s 13 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultLightSet;
	setAttr -s 7 ".dsm";
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
connectAttr "polySphere2.out" "pSphereShape2.i";
connectAttr "makeNurbsSquare1.oc1" "topnurbsSquareShape1.cr";
connectAttr "makeNurbsSquare1.oc2" "leftnurbsSquareShape1.cr";
connectAttr "makeNurbsSquare1.oc3" "bottomnurbsSquareShape1.cr";
connectAttr "makeNurbsSquare1.oc4" "rightnurbsSquareShape1.cr";
connectAttr "makeNurbCircle1.oc" "nurbsCircleShape1.cr";
connectAttr "joint1.s" "joint2.is";
connectAttr "joint2.s" "joint3.is";
connectAttr "joint3.s" "joint4.is";
connectAttr "makeNurbsSquare2.oc1" "topnurbsSquareShape2.cr";
connectAttr "makeNurbsSquare2.oc2" "leftnurbsSquareShape2.cr";
connectAttr "makeNurbsSquare2.oc3" "bottomnurbsSquareShape2.cr";
connectAttr "makeNurbsSquare2.oc4" "rightnurbsSquareShape2.cr";
connectAttr "makeNurbCircle2.oc" "nurbsCircleShape2.cr";
connectAttr "makeNurbSphere1.os" "nurbsSphereShape1.cr";
connectAttr "makeNurbCube1.os" "topnurbsCubeShape1.cr";
connectAttr "makeNurbCube1.os1" "bottomnurbsCubeShape1.cr";
connectAttr "makeNurbCube1.os2" "leftnurbsCubeShape1.cr";
connectAttr "makeNurbCube1.os3" "rightnurbsCubeShape1.cr";
connectAttr "makeNurbCube1.os4" "frontnurbsCubeShape1.cr";
connectAttr "makeNurbCube1.os5" "backnurbsCubeShape1.cr";
connectAttr ":time1.o" "hairSystemShape1.cti";
connectAttr "pSphere2FollicleShape606.oha" "hairSystemShape1.ih[0]";
connectAttr "pSphere2FollicleShape619.oha" "hairSystemShape1.ih[1]";
connectAttr "pSphere2FollicleShape631.oha" "hairSystemShape1.ih[2]";
connectAttr "pSphere2FollicleShape643.oha" "hairSystemShape1.ih[3]";
connectAttr "pSphere2FollicleShape656.oha" "hairSystemShape1.ih[4]";
connectAttr "pSphere2FollicleShape668.oha" "hairSystemShape1.ih[5]";
connectAttr "pSphere2FollicleShape680.oha" "hairSystemShape1.ih[6]";
connectAttr "pSphere2FollicleShape693.oha" "hairSystemShape1.ih[7]";
connectAttr "pSphere2FollicleShape1906.oha" "hairSystemShape1.ih[8]";
connectAttr "pSphere2FollicleShape1919.oha" "hairSystemShape1.ih[9]";
connectAttr "pSphere2FollicleShape1931.oha" "hairSystemShape1.ih[10]";
connectAttr "pSphere2FollicleShape1943.oha" "hairSystemShape1.ih[11]";
connectAttr "pSphere2FollicleShape1956.oha" "hairSystemShape1.ih[12]";
connectAttr "pSphere2FollicleShape1968.oha" "hairSystemShape1.ih[13]";
connectAttr "pSphere2FollicleShape1980.oha" "hairSystemShape1.ih[14]";
connectAttr "pSphere2FollicleShape1993.oha" "hairSystemShape1.ih[15]";
connectAttr "pSphere2FollicleShape3106.oha" "hairSystemShape1.ih[16]";
connectAttr "pSphere2FollicleShape3119.oha" "hairSystemShape1.ih[17]";
connectAttr "pSphere2FollicleShape3131.oha" "hairSystemShape1.ih[18]";
connectAttr "pSphere2FollicleShape3143.oha" "hairSystemShape1.ih[19]";
connectAttr "pSphere2FollicleShape3156.oha" "hairSystemShape1.ih[20]";
connectAttr "pSphere2FollicleShape3168.oha" "hairSystemShape1.ih[21]";
connectAttr "pSphere2FollicleShape3180.oha" "hairSystemShape1.ih[22]";
connectAttr "pSphere2FollicleShape3193.oha" "hairSystemShape1.ih[23]";
connectAttr "pSphere2FollicleShape4306.oha" "hairSystemShape1.ih[24]";
connectAttr "pSphere2FollicleShape4319.oha" "hairSystemShape1.ih[25]";
connectAttr "pSphere2FollicleShape4331.oha" "hairSystemShape1.ih[26]";
connectAttr "pSphere2FollicleShape4343.oha" "hairSystemShape1.ih[27]";
connectAttr "pSphere2FollicleShape4356.oha" "hairSystemShape1.ih[28]";
connectAttr "pSphere2FollicleShape4368.oha" "hairSystemShape1.ih[29]";
connectAttr "pSphere2FollicleShape4380.oha" "hairSystemShape1.ih[30]";
connectAttr "pSphere2FollicleShape4393.oha" "hairSystemShape1.ih[31]";
connectAttr "pSphere2FollicleShape5606.oha" "hairSystemShape1.ih[32]";
connectAttr "pSphere2FollicleShape5619.oha" "hairSystemShape1.ih[33]";
connectAttr "pSphere2FollicleShape5631.oha" "hairSystemShape1.ih[34]";
connectAttr "pSphere2FollicleShape5643.oha" "hairSystemShape1.ih[35]";
connectAttr "pSphere2FollicleShape5656.oha" "hairSystemShape1.ih[36]";
connectAttr "pSphere2FollicleShape5668.oha" "hairSystemShape1.ih[37]";
connectAttr "pSphere2FollicleShape5680.oha" "hairSystemShape1.ih[38]";
connectAttr "pSphere2FollicleShape5693.oha" "hairSystemShape1.ih[39]";
connectAttr "pSphere2FollicleShape6806.oha" "hairSystemShape1.ih[40]";
connectAttr "pSphere2FollicleShape6819.oha" "hairSystemShape1.ih[41]";
connectAttr "pSphere2FollicleShape6831.oha" "hairSystemShape1.ih[42]";
connectAttr "pSphere2FollicleShape6843.oha" "hairSystemShape1.ih[43]";
connectAttr "pSphere2FollicleShape6856.oha" "hairSystemShape1.ih[44]";
connectAttr "pSphere2FollicleShape6868.oha" "hairSystemShape1.ih[45]";
connectAttr "pSphere2FollicleShape6880.oha" "hairSystemShape1.ih[46]";
connectAttr "pSphere2FollicleShape6893.oha" "hairSystemShape1.ih[47]";
connectAttr "pSphere2FollicleShape8006.oha" "hairSystemShape1.ih[48]";
connectAttr "pSphere2FollicleShape8019.oha" "hairSystemShape1.ih[49]";
connectAttr "pSphere2FollicleShape8031.oha" "hairSystemShape1.ih[50]";
connectAttr "pSphere2FollicleShape8043.oha" "hairSystemShape1.ih[51]";
connectAttr "pSphere2FollicleShape8056.oha" "hairSystemShape1.ih[52]";
connectAttr "pSphere2FollicleShape8068.oha" "hairSystemShape1.ih[53]";
connectAttr "pSphere2FollicleShape8080.oha" "hairSystemShape1.ih[54]";
connectAttr "pSphere2FollicleShape8093.oha" "hairSystemShape1.ih[55]";
connectAttr "pSphere2FollicleShape9306.oha" "hairSystemShape1.ih[56]";
connectAttr "pSphere2FollicleShape9319.oha" "hairSystemShape1.ih[57]";
connectAttr "pSphere2FollicleShape9331.oha" "hairSystemShape1.ih[58]";
connectAttr "pSphere2FollicleShape9343.oha" "hairSystemShape1.ih[59]";
connectAttr "pSphere2FollicleShape9356.oha" "hairSystemShape1.ih[60]";
connectAttr "pSphere2FollicleShape9368.oha" "hairSystemShape1.ih[61]";
connectAttr "pSphere2FollicleShape9380.oha" "hairSystemShape1.ih[62]";
connectAttr "pSphere2FollicleShape9393.oha" "hairSystemShape1.ih[63]";
connectAttr "nucleus1.noao[0]" "hairSystemShape1.nxst";
connectAttr "nucleus1.stf" "hairSystemShape1.stf";
connectAttr "pSphere2FollicleShape606.ot" "pSphere2Follicle606.t" -l on;
connectAttr "pSphere2FollicleShape606.or" "pSphere2Follicle606.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape606.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape606.inm";
connectAttr "curveShape1.l" "pSphere2FollicleShape606.sp";
connectAttr "curve1.wm" "pSphere2FollicleShape606.spm";
connectAttr "pSphere2FollicleShape619.ot" "pSphere2Follicle619.t" -l on;
connectAttr "pSphere2FollicleShape619.or" "pSphere2Follicle619.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape619.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape619.inm";
connectAttr "curveShape2.l" "pSphere2FollicleShape619.sp";
connectAttr "curve2.wm" "pSphere2FollicleShape619.spm";
connectAttr "pSphere2FollicleShape631.ot" "pSphere2Follicle631.t" -l on;
connectAttr "pSphere2FollicleShape631.or" "pSphere2Follicle631.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape631.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape631.inm";
connectAttr "curveShape3.l" "pSphere2FollicleShape631.sp";
connectAttr "curve3.wm" "pSphere2FollicleShape631.spm";
connectAttr "pSphere2FollicleShape643.ot" "pSphere2Follicle643.t" -l on;
connectAttr "pSphere2FollicleShape643.or" "pSphere2Follicle643.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape643.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape643.inm";
connectAttr "curveShape4.l" "pSphere2FollicleShape643.sp";
connectAttr "curve4.wm" "pSphere2FollicleShape643.spm";
connectAttr "pSphere2FollicleShape656.ot" "pSphere2Follicle656.t" -l on;
connectAttr "pSphere2FollicleShape656.or" "pSphere2Follicle656.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape656.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape656.inm";
connectAttr "curveShape5.l" "pSphere2FollicleShape656.sp";
connectAttr "curve5.wm" "pSphere2FollicleShape656.spm";
connectAttr "pSphere2FollicleShape668.ot" "pSphere2Follicle668.t" -l on;
connectAttr "pSphere2FollicleShape668.or" "pSphere2Follicle668.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape668.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape668.inm";
connectAttr "curveShape6.l" "pSphere2FollicleShape668.sp";
connectAttr "curve6.wm" "pSphere2FollicleShape668.spm";
connectAttr "pSphere2FollicleShape680.ot" "pSphere2Follicle680.t" -l on;
connectAttr "pSphere2FollicleShape680.or" "pSphere2Follicle680.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape680.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape680.inm";
connectAttr "curveShape7.l" "pSphere2FollicleShape680.sp";
connectAttr "curve7.wm" "pSphere2FollicleShape680.spm";
connectAttr "pSphere2FollicleShape693.ot" "pSphere2Follicle693.t" -l on;
connectAttr "pSphere2FollicleShape693.or" "pSphere2Follicle693.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape693.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape693.inm";
connectAttr "curveShape8.l" "pSphere2FollicleShape693.sp";
connectAttr "curve8.wm" "pSphere2FollicleShape693.spm";
connectAttr "pSphere2FollicleShape1906.ot" "pSphere2Follicle1906.t" -l on;
connectAttr "pSphere2FollicleShape1906.or" "pSphere2Follicle1906.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape1906.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape1906.inm";
connectAttr "curveShape9.l" "pSphere2FollicleShape1906.sp";
connectAttr "curve9.wm" "pSphere2FollicleShape1906.spm";
connectAttr "pSphere2FollicleShape1919.ot" "pSphere2Follicle1919.t" -l on;
connectAttr "pSphere2FollicleShape1919.or" "pSphere2Follicle1919.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape1919.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape1919.inm";
connectAttr "curveShape10.l" "pSphere2FollicleShape1919.sp";
connectAttr "curve10.wm" "pSphere2FollicleShape1919.spm";
connectAttr "pSphere2FollicleShape1931.ot" "pSphere2Follicle1931.t" -l on;
connectAttr "pSphere2FollicleShape1931.or" "pSphere2Follicle1931.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape1931.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape1931.inm";
connectAttr "curveShape11.l" "pSphere2FollicleShape1931.sp";
connectAttr "curve11.wm" "pSphere2FollicleShape1931.spm";
connectAttr "pSphere2FollicleShape1943.ot" "pSphere2Follicle1943.t" -l on;
connectAttr "pSphere2FollicleShape1943.or" "pSphere2Follicle1943.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape1943.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape1943.inm";
connectAttr "curveShape12.l" "pSphere2FollicleShape1943.sp";
connectAttr "curve12.wm" "pSphere2FollicleShape1943.spm";
connectAttr "pSphere2FollicleShape1956.ot" "pSphere2Follicle1956.t" -l on;
connectAttr "pSphere2FollicleShape1956.or" "pSphere2Follicle1956.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape1956.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape1956.inm";
connectAttr "curveShape13.l" "pSphere2FollicleShape1956.sp";
connectAttr "curve13.wm" "pSphere2FollicleShape1956.spm";
connectAttr "pSphere2FollicleShape1968.ot" "pSphere2Follicle1968.t" -l on;
connectAttr "pSphere2FollicleShape1968.or" "pSphere2Follicle1968.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape1968.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape1968.inm";
connectAttr "curveShape14.l" "pSphere2FollicleShape1968.sp";
connectAttr "curve14.wm" "pSphere2FollicleShape1968.spm";
connectAttr "pSphere2FollicleShape1980.ot" "pSphere2Follicle1980.t" -l on;
connectAttr "pSphere2FollicleShape1980.or" "pSphere2Follicle1980.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape1980.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape1980.inm";
connectAttr "curveShape15.l" "pSphere2FollicleShape1980.sp";
connectAttr "curve15.wm" "pSphere2FollicleShape1980.spm";
connectAttr "pSphere2FollicleShape1993.ot" "pSphere2Follicle1993.t" -l on;
connectAttr "pSphere2FollicleShape1993.or" "pSphere2Follicle1993.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape1993.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape1993.inm";
connectAttr "curveShape16.l" "pSphere2FollicleShape1993.sp";
connectAttr "curve16.wm" "pSphere2FollicleShape1993.spm";
connectAttr "pSphere2FollicleShape3106.ot" "pSphere2Follicle3106.t" -l on;
connectAttr "pSphere2FollicleShape3106.or" "pSphere2Follicle3106.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape3106.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape3106.inm";
connectAttr "curveShape17.l" "pSphere2FollicleShape3106.sp";
connectAttr "curve17.wm" "pSphere2FollicleShape3106.spm";
connectAttr "pSphere2FollicleShape3119.ot" "pSphere2Follicle3119.t" -l on;
connectAttr "pSphere2FollicleShape3119.or" "pSphere2Follicle3119.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape3119.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape3119.inm";
connectAttr "curveShape18.l" "pSphere2FollicleShape3119.sp";
connectAttr "curve18.wm" "pSphere2FollicleShape3119.spm";
connectAttr "pSphere2FollicleShape3131.ot" "pSphere2Follicle3131.t" -l on;
connectAttr "pSphere2FollicleShape3131.or" "pSphere2Follicle3131.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape3131.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape3131.inm";
connectAttr "curveShape19.l" "pSphere2FollicleShape3131.sp";
connectAttr "curve19.wm" "pSphere2FollicleShape3131.spm";
connectAttr "pSphere2FollicleShape3143.ot" "pSphere2Follicle3143.t" -l on;
connectAttr "pSphere2FollicleShape3143.or" "pSphere2Follicle3143.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape3143.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape3143.inm";
connectAttr "curveShape20.l" "pSphere2FollicleShape3143.sp";
connectAttr "curve20.wm" "pSphere2FollicleShape3143.spm";
connectAttr "pSphere2FollicleShape3156.ot" "pSphere2Follicle3156.t" -l on;
connectAttr "pSphere2FollicleShape3156.or" "pSphere2Follicle3156.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape3156.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape3156.inm";
connectAttr "curveShape21.l" "pSphere2FollicleShape3156.sp";
connectAttr "curve21.wm" "pSphere2FollicleShape3156.spm";
connectAttr "pSphere2FollicleShape3168.ot" "pSphere2Follicle3168.t" -l on;
connectAttr "pSphere2FollicleShape3168.or" "pSphere2Follicle3168.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape3168.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape3168.inm";
connectAttr "curveShape22.l" "pSphere2FollicleShape3168.sp";
connectAttr "curve22.wm" "pSphere2FollicleShape3168.spm";
connectAttr "pSphere2FollicleShape3180.ot" "pSphere2Follicle3180.t" -l on;
connectAttr "pSphere2FollicleShape3180.or" "pSphere2Follicle3180.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape3180.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape3180.inm";
connectAttr "curveShape23.l" "pSphere2FollicleShape3180.sp";
connectAttr "curve23.wm" "pSphere2FollicleShape3180.spm";
connectAttr "pSphere2FollicleShape3193.ot" "pSphere2Follicle3193.t" -l on;
connectAttr "pSphere2FollicleShape3193.or" "pSphere2Follicle3193.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape3193.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape3193.inm";
connectAttr "curveShape24.l" "pSphere2FollicleShape3193.sp";
connectAttr "curve24.wm" "pSphere2FollicleShape3193.spm";
connectAttr "pSphere2FollicleShape4306.ot" "pSphere2Follicle4306.t" -l on;
connectAttr "pSphere2FollicleShape4306.or" "pSphere2Follicle4306.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape4306.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape4306.inm";
connectAttr "curveShape25.l" "pSphere2FollicleShape4306.sp";
connectAttr "curve25.wm" "pSphere2FollicleShape4306.spm";
connectAttr "pSphere2FollicleShape4319.ot" "pSphere2Follicle4319.t" -l on;
connectAttr "pSphere2FollicleShape4319.or" "pSphere2Follicle4319.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape4319.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape4319.inm";
connectAttr "curveShape26.l" "pSphere2FollicleShape4319.sp";
connectAttr "curve26.wm" "pSphere2FollicleShape4319.spm";
connectAttr "pSphere2FollicleShape4331.ot" "pSphere2Follicle4331.t" -l on;
connectAttr "pSphere2FollicleShape4331.or" "pSphere2Follicle4331.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape4331.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape4331.inm";
connectAttr "curveShape27.l" "pSphere2FollicleShape4331.sp";
connectAttr "curve27.wm" "pSphere2FollicleShape4331.spm";
connectAttr "pSphere2FollicleShape4343.ot" "pSphere2Follicle4343.t" -l on;
connectAttr "pSphere2FollicleShape4343.or" "pSphere2Follicle4343.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape4343.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape4343.inm";
connectAttr "curveShape28.l" "pSphere2FollicleShape4343.sp";
connectAttr "curve28.wm" "pSphere2FollicleShape4343.spm";
connectAttr "pSphere2FollicleShape4356.ot" "pSphere2Follicle4356.t" -l on;
connectAttr "pSphere2FollicleShape4356.or" "pSphere2Follicle4356.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape4356.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape4356.inm";
connectAttr "curveShape29.l" "pSphere2FollicleShape4356.sp";
connectAttr "curve29.wm" "pSphere2FollicleShape4356.spm";
connectAttr "pSphere2FollicleShape4368.ot" "pSphere2Follicle4368.t" -l on;
connectAttr "pSphere2FollicleShape4368.or" "pSphere2Follicle4368.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape4368.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape4368.inm";
connectAttr "curveShape30.l" "pSphere2FollicleShape4368.sp";
connectAttr "curve30.wm" "pSphere2FollicleShape4368.spm";
connectAttr "pSphere2FollicleShape4380.ot" "pSphere2Follicle4380.t" -l on;
connectAttr "pSphere2FollicleShape4380.or" "pSphere2Follicle4380.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape4380.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape4380.inm";
connectAttr "curveShape31.l" "pSphere2FollicleShape4380.sp";
connectAttr "curve31.wm" "pSphere2FollicleShape4380.spm";
connectAttr "pSphere2FollicleShape4393.ot" "pSphere2Follicle4393.t" -l on;
connectAttr "pSphere2FollicleShape4393.or" "pSphere2Follicle4393.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape4393.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape4393.inm";
connectAttr "curveShape32.l" "pSphere2FollicleShape4393.sp";
connectAttr "curve32.wm" "pSphere2FollicleShape4393.spm";
connectAttr "pSphere2FollicleShape5606.ot" "pSphere2Follicle5606.t" -l on;
connectAttr "pSphere2FollicleShape5606.or" "pSphere2Follicle5606.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape5606.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape5606.inm";
connectAttr "curveShape33.l" "pSphere2FollicleShape5606.sp";
connectAttr "curve33.wm" "pSphere2FollicleShape5606.spm";
connectAttr "pSphere2FollicleShape5619.ot" "pSphere2Follicle5619.t" -l on;
connectAttr "pSphere2FollicleShape5619.or" "pSphere2Follicle5619.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape5619.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape5619.inm";
connectAttr "curveShape34.l" "pSphere2FollicleShape5619.sp";
connectAttr "curve34.wm" "pSphere2FollicleShape5619.spm";
connectAttr "pSphere2FollicleShape5631.ot" "pSphere2Follicle5631.t" -l on;
connectAttr "pSphere2FollicleShape5631.or" "pSphere2Follicle5631.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape5631.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape5631.inm";
connectAttr "curveShape35.l" "pSphere2FollicleShape5631.sp";
connectAttr "curve35.wm" "pSphere2FollicleShape5631.spm";
connectAttr "pSphere2FollicleShape5643.ot" "pSphere2Follicle5643.t" -l on;
connectAttr "pSphere2FollicleShape5643.or" "pSphere2Follicle5643.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape5643.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape5643.inm";
connectAttr "curveShape36.l" "pSphere2FollicleShape5643.sp";
connectAttr "curve36.wm" "pSphere2FollicleShape5643.spm";
connectAttr "pSphere2FollicleShape5656.ot" "pSphere2Follicle5656.t" -l on;
connectAttr "pSphere2FollicleShape5656.or" "pSphere2Follicle5656.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape5656.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape5656.inm";
connectAttr "curveShape37.l" "pSphere2FollicleShape5656.sp";
connectAttr "curve37.wm" "pSphere2FollicleShape5656.spm";
connectAttr "pSphere2FollicleShape5668.ot" "pSphere2Follicle5668.t" -l on;
connectAttr "pSphere2FollicleShape5668.or" "pSphere2Follicle5668.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape5668.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape5668.inm";
connectAttr "curveShape38.l" "pSphere2FollicleShape5668.sp";
connectAttr "curve38.wm" "pSphere2FollicleShape5668.spm";
connectAttr "pSphere2FollicleShape5680.ot" "pSphere2Follicle5680.t" -l on;
connectAttr "pSphere2FollicleShape5680.or" "pSphere2Follicle5680.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape5680.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape5680.inm";
connectAttr "curveShape39.l" "pSphere2FollicleShape5680.sp";
connectAttr "curve39.wm" "pSphere2FollicleShape5680.spm";
connectAttr "pSphere2FollicleShape5693.ot" "pSphere2Follicle5693.t" -l on;
connectAttr "pSphere2FollicleShape5693.or" "pSphere2Follicle5693.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape5693.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape5693.inm";
connectAttr "curveShape40.l" "pSphere2FollicleShape5693.sp";
connectAttr "curve40.wm" "pSphere2FollicleShape5693.spm";
connectAttr "pSphere2FollicleShape6806.ot" "pSphere2Follicle6806.t" -l on;
connectAttr "pSphere2FollicleShape6806.or" "pSphere2Follicle6806.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape6806.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape6806.inm";
connectAttr "curveShape41.l" "pSphere2FollicleShape6806.sp";
connectAttr "curve41.wm" "pSphere2FollicleShape6806.spm";
connectAttr "pSphere2FollicleShape6819.ot" "pSphere2Follicle6819.t" -l on;
connectAttr "pSphere2FollicleShape6819.or" "pSphere2Follicle6819.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape6819.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape6819.inm";
connectAttr "curveShape42.l" "pSphere2FollicleShape6819.sp";
connectAttr "curve42.wm" "pSphere2FollicleShape6819.spm";
connectAttr "pSphere2FollicleShape6831.ot" "pSphere2Follicle6831.t" -l on;
connectAttr "pSphere2FollicleShape6831.or" "pSphere2Follicle6831.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape6831.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape6831.inm";
connectAttr "curveShape43.l" "pSphere2FollicleShape6831.sp";
connectAttr "curve43.wm" "pSphere2FollicleShape6831.spm";
connectAttr "pSphere2FollicleShape6843.ot" "pSphere2Follicle6843.t" -l on;
connectAttr "pSphere2FollicleShape6843.or" "pSphere2Follicle6843.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape6843.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape6843.inm";
connectAttr "curveShape44.l" "pSphere2FollicleShape6843.sp";
connectAttr "curve44.wm" "pSphere2FollicleShape6843.spm";
connectAttr "pSphere2FollicleShape6856.ot" "pSphere2Follicle6856.t" -l on;
connectAttr "pSphere2FollicleShape6856.or" "pSphere2Follicle6856.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape6856.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape6856.inm";
connectAttr "curveShape45.l" "pSphere2FollicleShape6856.sp";
connectAttr "curve45.wm" "pSphere2FollicleShape6856.spm";
connectAttr "pSphere2FollicleShape6868.ot" "pSphere2Follicle6868.t" -l on;
connectAttr "pSphere2FollicleShape6868.or" "pSphere2Follicle6868.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape6868.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape6868.inm";
connectAttr "curveShape46.l" "pSphere2FollicleShape6868.sp";
connectAttr "curve46.wm" "pSphere2FollicleShape6868.spm";
connectAttr "pSphere2FollicleShape6880.ot" "pSphere2Follicle6880.t" -l on;
connectAttr "pSphere2FollicleShape6880.or" "pSphere2Follicle6880.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape6880.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape6880.inm";
connectAttr "curveShape47.l" "pSphere2FollicleShape6880.sp";
connectAttr "curve47.wm" "pSphere2FollicleShape6880.spm";
connectAttr "pSphere2FollicleShape6893.ot" "pSphere2Follicle6893.t" -l on;
connectAttr "pSphere2FollicleShape6893.or" "pSphere2Follicle6893.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape6893.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape6893.inm";
connectAttr "curveShape48.l" "pSphere2FollicleShape6893.sp";
connectAttr "curve48.wm" "pSphere2FollicleShape6893.spm";
connectAttr "pSphere2FollicleShape8006.ot" "pSphere2Follicle8006.t" -l on;
connectAttr "pSphere2FollicleShape8006.or" "pSphere2Follicle8006.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape8006.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape8006.inm";
connectAttr "curveShape49.l" "pSphere2FollicleShape8006.sp";
connectAttr "curve49.wm" "pSphere2FollicleShape8006.spm";
connectAttr "pSphere2FollicleShape8019.ot" "pSphere2Follicle8019.t" -l on;
connectAttr "pSphere2FollicleShape8019.or" "pSphere2Follicle8019.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape8019.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape8019.inm";
connectAttr "curveShape50.l" "pSphere2FollicleShape8019.sp";
connectAttr "curve50.wm" "pSphere2FollicleShape8019.spm";
connectAttr "pSphere2FollicleShape8031.ot" "pSphere2Follicle8031.t" -l on;
connectAttr "pSphere2FollicleShape8031.or" "pSphere2Follicle8031.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape8031.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape8031.inm";
connectAttr "curveShape51.l" "pSphere2FollicleShape8031.sp";
connectAttr "curve51.wm" "pSphere2FollicleShape8031.spm";
connectAttr "pSphere2FollicleShape8043.ot" "pSphere2Follicle8043.t" -l on;
connectAttr "pSphere2FollicleShape8043.or" "pSphere2Follicle8043.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape8043.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape8043.inm";
connectAttr "curveShape52.l" "pSphere2FollicleShape8043.sp";
connectAttr "curve52.wm" "pSphere2FollicleShape8043.spm";
connectAttr "pSphere2FollicleShape8056.ot" "pSphere2Follicle8056.t" -l on;
connectAttr "pSphere2FollicleShape8056.or" "pSphere2Follicle8056.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape8056.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape8056.inm";
connectAttr "curveShape53.l" "pSphere2FollicleShape8056.sp";
connectAttr "curve53.wm" "pSphere2FollicleShape8056.spm";
connectAttr "pSphere2FollicleShape8068.ot" "pSphere2Follicle8068.t" -l on;
connectAttr "pSphere2FollicleShape8068.or" "pSphere2Follicle8068.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape8068.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape8068.inm";
connectAttr "curveShape54.l" "pSphere2FollicleShape8068.sp";
connectAttr "curve54.wm" "pSphere2FollicleShape8068.spm";
connectAttr "pSphere2FollicleShape8080.ot" "pSphere2Follicle8080.t" -l on;
connectAttr "pSphere2FollicleShape8080.or" "pSphere2Follicle8080.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape8080.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape8080.inm";
connectAttr "curveShape55.l" "pSphere2FollicleShape8080.sp";
connectAttr "curve55.wm" "pSphere2FollicleShape8080.spm";
connectAttr "pSphere2FollicleShape8093.ot" "pSphere2Follicle8093.t" -l on;
connectAttr "pSphere2FollicleShape8093.or" "pSphere2Follicle8093.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape8093.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape8093.inm";
connectAttr "curveShape56.l" "pSphere2FollicleShape8093.sp";
connectAttr "curve56.wm" "pSphere2FollicleShape8093.spm";
connectAttr "pSphere2FollicleShape9306.ot" "pSphere2Follicle9306.t" -l on;
connectAttr "pSphere2FollicleShape9306.or" "pSphere2Follicle9306.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape9306.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape9306.inm";
connectAttr "curveShape57.l" "pSphere2FollicleShape9306.sp";
connectAttr "curve57.wm" "pSphere2FollicleShape9306.spm";
connectAttr "pSphere2FollicleShape9319.ot" "pSphere2Follicle9319.t" -l on;
connectAttr "pSphere2FollicleShape9319.or" "pSphere2Follicle9319.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape9319.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape9319.inm";
connectAttr "curveShape58.l" "pSphere2FollicleShape9319.sp";
connectAttr "curve58.wm" "pSphere2FollicleShape9319.spm";
connectAttr "pSphere2FollicleShape9331.ot" "pSphere2Follicle9331.t" -l on;
connectAttr "pSphere2FollicleShape9331.or" "pSphere2Follicle9331.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape9331.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape9331.inm";
connectAttr "curveShape59.l" "pSphere2FollicleShape9331.sp";
connectAttr "curve59.wm" "pSphere2FollicleShape9331.spm";
connectAttr "pSphere2FollicleShape9343.ot" "pSphere2Follicle9343.t" -l on;
connectAttr "pSphere2FollicleShape9343.or" "pSphere2Follicle9343.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape9343.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape9343.inm";
connectAttr "curveShape60.l" "pSphere2FollicleShape9343.sp";
connectAttr "curve60.wm" "pSphere2FollicleShape9343.spm";
connectAttr "pSphere2FollicleShape9356.ot" "pSphere2Follicle9356.t" -l on;
connectAttr "pSphere2FollicleShape9356.or" "pSphere2Follicle9356.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape9356.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape9356.inm";
connectAttr "curveShape61.l" "pSphere2FollicleShape9356.sp";
connectAttr "curve61.wm" "pSphere2FollicleShape9356.spm";
connectAttr "pSphere2FollicleShape9368.ot" "pSphere2Follicle9368.t" -l on;
connectAttr "pSphere2FollicleShape9368.or" "pSphere2Follicle9368.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape9368.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape9368.inm";
connectAttr "curveShape62.l" "pSphere2FollicleShape9368.sp";
connectAttr "curve62.wm" "pSphere2FollicleShape9368.spm";
connectAttr "pSphere2FollicleShape9380.ot" "pSphere2Follicle9380.t" -l on;
connectAttr "pSphere2FollicleShape9380.or" "pSphere2Follicle9380.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape9380.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape9380.inm";
connectAttr "curveShape63.l" "pSphere2FollicleShape9380.sp";
connectAttr "curve63.wm" "pSphere2FollicleShape9380.spm";
connectAttr "pSphere2FollicleShape9393.ot" "pSphere2Follicle9393.t" -l on;
connectAttr "pSphere2FollicleShape9393.or" "pSphere2Follicle9393.r" -l on;
connectAttr "pSphereShape2.wm" "pSphere2FollicleShape9393.iwm";
connectAttr "pSphereShape2.o" "pSphere2FollicleShape9393.inm";
connectAttr "curveShape64.l" "pSphere2FollicleShape9393.sp";
connectAttr "curve64.wm" "pSphere2FollicleShape9393.spm";
connectAttr "hairSystemShape1.orh" "pfxHairShape1.rhs";
connectAttr ":time1.o" "nucleus1.cti";
connectAttr "hairSystemShape1.cust" "nucleus1.niao[0]";
connectAttr "hairSystemShape1.stst" "nucleus1.nias[0]";
connectAttr "polyCube2.out" "pCubeShape2.i";
connectAttr "polyCylinder1.out" "pCylinderShape1.i";
connectAttr "polySphere1.out" "pSphereShape1.i";
connectAttr "polyCylinder2.out" "pCylinderShape2.i";
connectAttr "polyCube1.out" "pCubeShape1.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":defaultArnoldDisplayDriver.msg" ":defaultArnoldRenderOptions.drivers"
		 -na;
connectAttr ":defaultArnoldFilter.msg" ":defaultArnoldRenderOptions.filt";
connectAttr ":defaultArnoldDriver.msg" ":defaultArnoldRenderOptions.drvr";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "ambientLightShape1.ltd" ":lightList1.l" -na;
connectAttr "directionalLightShape1.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape1.ltd" ":lightList1.l" -na;
connectAttr "spotLightShape1.ltd" ":lightList1.l" -na;
connectAttr "areaLightShape1.ltd" ":lightList1.l" -na;
connectAttr "volumeLightShape1.ltd" ":lightList1.l" -na;
connectAttr "spotLightShape2.ltd" ":lightList1.l" -na;
connectAttr "pCylinderShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "nurbsSphereShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "topnurbsCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "bottomnurbsCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "leftnurbsCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "rightnurbsCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "frontnurbsCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "backnurbsCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "ambientLight1.iog" ":defaultLightSet.dsm" -na;
connectAttr "directionalLight1.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight1.iog" ":defaultLightSet.dsm" -na;
connectAttr "spotLight1.iog" ":defaultLightSet.dsm" -na;
connectAttr "areaLight1.iog" ":defaultLightSet.dsm" -na;
connectAttr "volumeLight1.iog" ":defaultLightSet.dsm" -na;
connectAttr "spotLight2.iog" ":defaultLightSet.dsm" -na;
// End of Testcsens.ma
