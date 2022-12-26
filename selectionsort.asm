org 100h         

MOV BX,0500H 
   
;kendi belirledigimiz rastgele 10 sayi 
MOV BYTE PTR [bx],68h
MOV BYTE PTR [bx+1],71H
MOV BYTE PTR [bx+2],42H
MOV BYTE PTR [bx+3],13H
MOV BYTE PTR [bx+4],26H
MOV BYTE PTR [bx+5],84H
MOV BYTE PTR [bx+6],09H
MOV BYTE PTR [bx+7],23H
MOV BYTE PTR [bx+8],4EH
MOV BYTE PTR [bx+9],22H




MOV BX,0500H    ; baslagic adresi
MOV DI,0        ; bulundugumuz indis 
MOV SI,0        ; yurutulen indis degerini tutar


L1:         

MOV DL,[BX+DI] ; DL, en kucuk sayinin tutuldugu register      
INC SI         ; SI = SI+1

L2:

MOV AL,[BX+SI] ; AL=SI
CMP AL,DL      ; DI degeri SI degerinden buyuk mu
JB SKIP        ; eger buyukse SKIP adimina gec

INC SI         ; SI degerini 1 arttir
CMP SI,09      ; SI nin son elemana mi esit oldugu kontrolu yapilir
JBE L2         ; son eleman olana kadar L2 yi tekrarla
         
INC DI         ; SI = [bx+9] ise DI elemanini 1 arttir
CMP DI,09     
JB L1          ; tum sayilara bakilana kadar L1 dongusunu tekrarla
HLT            


SKIP: ;elemanlari adreslerine kopyalama

;en kucuk eleman icin
MOV CL,AL 
MOV AL,DL  ;indis kopyalanir
MOV DL,CL  ;sayi kopyalanir

;en buyuk elaman icin
MOV CL ,[BX+SI]         
MOV BYTE PTR [BX+SI],AL 
MOV BYTE PTR [BX+DI],CL 



INC SI          ; SI yi 1 arttir    
CMP SI,09       ; SI = [bx+9] esit mi  
JBE L2          ; esit degilse L2 ye don
JA L1           ; esit ise L1 e don

HLT             ;bitir
