FasdUAS 1.101.10   ��   ��    k             l      ��  ��   D>
# This script does:

- gets content of note of selected row (this should be a latex - math command) 
- passes the string of this content to a python script that generates a pdf of the latex string
- pastes a pdf of your latex string at the end of the selected row (not the note, the note stays there, found to be useful for future reference)

# Instructions:

- put the `OO_latex.scpt` into `~/Library/Application Scripts/com.omnigroup.OmniOutliner5/`(if not exists create a folder)
- put the `create_latex_pdf.py` into `/Documents/OmniOutliner5` (if not exists create a folder)
- then you can access the script from the script icon in the menubar


# This script requires

- a valid pdflatex installation, which is in the PATH variable set in ~/.bash_profile
- python with packages sys, os, datetime, time
- pdfcrop(http://pdfcrop.sourceforge.net/)


# Thanks!

- origin code from Claus Haslauer (https://github.com/clausTue/OO_latex) 
- modify by Yu Wang (https://github.com/wyhitcs/Latex_in_OO) at 2016.4.17
- modify by Miao Cai (https://github.com/Hephaest/OO_latex) at 2019.12.21
     � 	 	| 
 #   T h i s   s c r i p t   d o e s : 
 
 -   g e t s   c o n t e n t   o f   n o t e   o f   s e l e c t e d   r o w   ( t h i s   s h o u l d   b e   a   l a t e x   -   m a t h   c o m m a n d )   
 -   p a s s e s   t h e   s t r i n g   o f   t h i s   c o n t e n t   t o   a   p y t h o n   s c r i p t   t h a t   g e n e r a t e s   a   p d f   o f   t h e   l a t e x   s t r i n g 
 -   p a s t e s   a   p d f   o f   y o u r   l a t e x   s t r i n g   a t   t h e   e n d   o f   t h e   s e l e c t e d   r o w   ( n o t   t h e   n o t e ,   t h e   n o t e   s t a y s   t h e r e ,   f o u n d   t o   b e   u s e f u l   f o r   f u t u r e   r e f e r e n c e ) 
 
 #   I n s t r u c t i o n s : 
 
 -   p u t   t h e   ` O O _ l a t e x . s c p t `   i n t o   ` ~ / L i b r a r y / A p p l i c a t i o n   S c r i p t s / c o m . o m n i g r o u p . O m n i O u t l i n e r 5 / ` ( i f   n o t   e x i s t s   c r e a t e   a   f o l d e r ) 
 -   p u t   t h e   ` c r e a t e _ l a t e x _ p d f . p y `   i n t o   ` / D o c u m e n t s / O m n i O u t l i n e r 5 `   ( i f   n o t   e x i s t s   c r e a t e   a   f o l d e r ) 
 -   t h e n   y o u   c a n   a c c e s s   t h e   s c r i p t   f r o m   t h e   s c r i p t   i c o n   i n   t h e   m e n u b a r 
 
 
 #   T h i s   s c r i p t   r e q u i r e s 
 
 -   a   v a l i d   p d f l a t e x   i n s t a l l a t i o n ,   w h i c h   i s   i n   t h e   P A T H   v a r i a b l e   s e t   i n   ~ / . b a s h _ p r o f i l e 
 -   p y t h o n   w i t h   p a c k a g e s   s y s ,   o s ,   d a t e t i m e ,   t i m e 
 -   p d f c r o p ( h t t p : / / p d f c r o p . s o u r c e f o r g e . n e t / ) 
 
 
 #   T h a n k s ! 
 
 -   o r i g i n   c o d e   f r o m   C l a u s   H a s l a u e r   ( h t t p s : / / g i t h u b . c o m / c l a u s T u e / O O _ l a t e x )   
 -   m o d i f y   b y   Y u   W a n g   ( h t t p s : / / g i t h u b . c o m / w y h i t c s / L a t e x _ i n _ O O )   a t   2 0 1 6 . 4 . 1 7 
 -   m o d i f y   b y   M i a o   C a i   ( h t t p s : / / g i t h u b . c o m / H e p h a e s t / O O _ l a t e x )   a t   2 0 1 9 . 1 2 . 2 1 
   
  
 l     ��������  ��  ��        l     ����  r         n     	    1    	��
�� 
psxp  l     ����  I    ��  
�� .earsffdralis        afdr  m     ��
�� afdrdocs  �� ��
�� 
rtyp  m    ��
�� 
TEXT��  ��  ��    o      ���� 0 
mydocument 
myDocument��  ��        l    ����  r        b        o    ���� 0 
mydocument 
myDocument  m       �    O m n i O u t l i n e r 5  o      ���� 0 pydir pyDir��  ��       !   l     ��������  ��  ��   !  " # " l     ��������  ��  ��   #  $ % $ l     �� & '��   & @ : #! get text (a latex string) out of note of selected cell    ' � ( ( t   # !   g e t   t e x t   ( a   l a t e x   s t r i n g )   o u t   o f   n o t e   o f   s e l e c t e d   c e l l %  ) * ) l     ��������  ��  ��   *  + , + l    -���� - r     . / . J    ����   / o      ���� 0 lstnote lstNote��  ��   ,  0 1 0 l   * 2���� 2 O   * 3 4 3 r    ) 5 6 5 n    ' 7 8 7 1   % '��
�� 
OOnt 8 n    % 9 : 9 2  # %��
�� 
OOsr : 4   #�� ;
�� 
docu ; m   ! "����  6 o      ���� 0 lstnote lstNote 4 5    �� <��
�� 
capp < m     = = � > >  O O u t
�� kfrmID  ��  ��   1  ? @ ? l  + 2 A���� A r   + 2 B C B c   + . D E D o   + ,���� 0 lstnote lstNote E m   , -��
�� 
ctxt C o      ���� 0 strnote strNote��  ��   @  F G F l  3 A H���� H r   3 A I J I n   3 = K L K 1   9 =��
�� 
strq L n   3 9 M N M 4   4 9�� O
�� 
cobj O m   7 8����  N o   3 4���� 0 lstnote lstNote J o      ���� 0 strnoteq strNoteQ��  ��   G  P Q P l     �� R S��   R   if lstNote � {} then    S � T T *   i f   l s t N o t e  "`   { }   t h e n Q  U V U l     ��������  ��  ��   V  W X W l     ��������  ��  ��   X  Y Z Y l     ��������  ��  ��   Z  [ \ [ l  B S ]���� ] I  B S�� ^��
�� .sysoexecTEXT���     TEXT ^ b   B O _ ` _ b   B K a b a b   B G c d c m   B E e e � f f 4 s o u r c e   ~ / . b a s h _ p r o f i l e ; c d   d o   E F���� 0 pydir pyDir b m   G J g g � h h < ;   p y t h o n 3   c r e a t e _ l a t e x _ p d f . p y   ` o   K N���� 0 strnoteq strNoteQ��  ��  ��   \  i j i l     ��������  ��  ��   j  k l k l     �� m n��   m / ) #! select the path where the pdf resides    n � o o R   # !   s e l e c t   t h e   p a t h   w h e r e   t h e   p d f   r e s i d e s l  p q p l     ��������  ��  ��   q  r s r l  T h t���� t O   T h u v u I  Z g�� w��
�� .coredoscnull��� ��� ctxt w b   Z c x y x b   Z _ z { z m   Z ] | | � } }  c d   { o   ] ^���� 0 pydir pyDir y m   _ b ~ ~ �   N   ;   / L i b r a r y / T e X / t e x b i n / p d f c r o p   t e m p . p d f��   v m   T W � ��                                                                                      @ alis    <  Macintosh HD                   BD ����Terminal.app                                                   ����            ����  
 cu             	Utilities   &/:Applications:Utilities:Terminal.app/    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  ��  ��   s  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � = 7 delay 3 sec in case that temp-crop.pdf do not generate    � � � � n   d e l a y   3   s e c   i n   c a s e   t h a t   t e m p - c r o p . p d f   d o   n o t   g e n e r a t e �  � � � l  i n ����� � I  i n�� ���
�� .sysodelanull��� ��� nmbr � m   i j���� ��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l  o x ����� � r   o x � � � b   o t � � � o   o p���� 0 pydir pyDir � m   p s � � � � �  / t e m p - c r o p . p d f � o      ���� 0 pdfpath pdfPath��  ��   �  � � � l  y � ����� � r   y � � � � 4   y ��� �
�� 
psxf � o   } ����� 0 pdfpath pdfPath � o      ���� 0 pdffile pdfFile��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � H B #! set the pdf to a file attachment of the currently selected row    � � � � �   # !   s e t   t h e   p d f   t o   a   f i l e   a t t a c h m e n t   o f   t h e   c u r r e n t l y   s e l e c t e d   r o w �  � � � l  � � ����� � O   � � � � � k   � � � �  � � � l  � ���������  ��  ��   �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
OOTc � 4  � ��� �
�� 
OOsr � m   � �����  � o      ���� 0 
targetcell 
targetCell �  � � � l  � ��� � ���   � &  set text of targetCell to "Bam!"    � � � � @ s e t   t e x t   o f   t a r g e t C e l l   t o   " B a m ! " �  � � � l  � ���������  ��  ��   �  � � � O   � � � � � k   � � � �  � � � I  � ����� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m   � ���
�� 
OSfA � � � �
� 
prdt � K   � � � � �~ � �
�~ 
atfn � o   � ��}�} 0 pdffile pdfFile � �| ��{
�| 
OSin � m   � ��z
�z boovtrue�{   � �y ��x
�y 
insh � n   � � � � �  ;   � � � 2  � ��w
�w 
cha �x   �  � � � l  � ��v � ��v   � z tmake new file attachment with properties {file name:POSIX file myAttachmentPath, embedded:true} at end of characters    � � � � � m a k e   n e w   f i l e   a t t a c h m e n t   w i t h   p r o p e r t i e s   { f i l e   n a m e : P O S I X   f i l e   m y A t t a c h m e n t P a t h ,   e m b e d d e d : t r u e }   a t   e n d   o f   c h a r a c t e r s �  ��u � l  � ��t�s�r�t  �s  �r  �u   � n   � � � � � m   � ��q
�q 
ctxt � o   � ��p�p 0 
targetcell 
targetCell �  ��o � l  � ��n�m�l�n  �m  �l  �o   � n   � � � � � 4  � ��k �
�k 
docu � m   � ��j�j  � m   � � � ��                                                                                  OOut  alis    :  Macintosh HD                   BD ����OmniOutliner.app                                               ����            ����  
 cu             Applications   /:Applications:OmniOutliner.app/  "  O m n i O u t l i n e r . a p p    M a c i n t o s h   H D  Applications/OmniOutliner.app   / ��  ��  ��   �  � � � l     �i�h�g�i  �h  �g   �  � � � l  � � ��f�e � I  � ��d ��c
�d .sysoexecTEXT���     TEXT � m   � � � � � � �   k i l l a l l   T e r m i n a l�c  �f  �e   �  � � � l     �b�a�`�b  �a  �`   �  � � � l     �_�^�]�_  �^  �]   �  � � � l     �\�[�Z�\  �[  �Z   �  � � � l     �Y�X�W�Y  �X  �W   �  ��V � l     �U�T�S�U  �T  �S  �V       �R � � � � � � � � � ��Q�P�O�N�M�L�K�R   � �J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;
�J .aevtoappnull  �   � ****�I 0 
mydocument 
myDocument�H 0 pydir pyDir�G 0 lstnote lstNote�F 0 strnote strNote�E 0 strnoteq strNoteQ�D 0 pdfpath pdfPath�C 0 pdffile pdfFile�B 0 
targetcell 
targetCell�A  �@  �?  �>  �=  �<  �;   � �: ��9�8 � ��7
�: .aevtoappnull  �   � **** � k     � � �   � �   � �  + � �  0 � �  ? � �  F    [  r  �  �  �  �  ��6�6  �9  �8   �   � .�5�4�3�2�1�0 �/�.�- =�,�+�*�)�(�'�&�%�$ e g�# � | ~�"�! �� �� ������������� �
�5 afdrdocs
�4 
rtyp
�3 
TEXT
�2 .earsffdralis        afdr
�1 
psxp�0 0 
mydocument 
myDocument�/ 0 pydir pyDir�. 0 lstnote lstNote
�- 
capp
�, kfrmID  
�+ 
docu
�* 
OOsr
�) 
OOnt
�( 
ctxt�' 0 strnote strNote
�& 
cobj
�% 
strq�$ 0 strnoteq strNoteQ
�# .sysoexecTEXT���     TEXT
�" .coredoscnull��� ��� ctxt
�! .sysodelanull��� ��� nmbr�  0 pdfpath pdfPath
� 
psxf� 0 pdffile pdfFile
� 
OOTc� 0 
targetcell 
targetCell
� 
kocl
� 
OSfA
� 
prdt
� 
atfn
� 
OSin� 
� 
insh
� 
cha � 
� .corecrel****      � null�7 ����l �,E�O��%E�OjvE�O)���0 *�k/�-�,E�UO��&E` O�a k/a ,E` Oa �%a %_ %j Oa  a �%a %j UOmj O�a %E` O*a _ /E` Oa  �k/ C*�k/a !,E` "O_ "�- +*a #a $a %a &_ a 'ea (a )*a *-6a + ,OPUOPUOa -j  � � 4 / U s e r s / h e p h a e s t / D o c u m e n t s / � � N / U s e r s / h e p h a e s t / D o c u m e n t s / O m n i O u t l i n e r 5 � �	� 	   � � �

� t   \ t e x t   {   - s t a t   } = \ f r a c { \ o p e r a t o r n a m e { a v g } \ l e f t ( R _ { t } - r _ { f } \ r i g h t ) } { \ o p e r a t o r n a m e { S t d } \ l e f t ( R _ { t } - r _ { f } \ r i g h t )   /   \ s q r t { T } } = \ f r a c { \ o p e r a t o r n a m e { a v g } \ l e f t ( R _ { t } - r _ { f } \ r i g h t ) } { \ o p e r a t o r n a m e { S t d } \ l e f t ( R _ { t } - r _ { f } \ r i g h t ) }   \ s q r t { T } � �� ' t   \ t e x t   {   - s t a t   } = \ f r a c { \ o p e r a t o r n a m e { a v g } \ l e f t ( R _ { t } - r _ { f } \ r i g h t ) } { \ o p e r a t o r n a m e { S t d } \ l e f t ( R _ { t } - r _ { f } \ r i g h t )   /   \ s q r t { T } } = \ f r a c { \ o p e r a t o r n a m e { a v g } \ l e f t ( R _ { t } - r _ { f } \ r i g h t ) } { \ o p e r a t o r n a m e { S t d } \ l e f t ( R _ { t } - r _ { f } \ r i g h t ) }   \ s q r t { T } ' � � j / U s e r s / h e p h a e s t / D o c u m e n t s / O m n i O u t l i n e r 5 / t e m p - c r o p . p d f � @furlfile:///Users/hephaest/Documents/OmniOutliner5/temp-crop.pdf �  �� �� ��  ��
�	
�
 
docu �  m c N B e p P c e z 7
�	 kfrmID  
� 
OOsu� 
� 
OOsu� 
� 
OOce �  j F q H U G d _ D g 1
� kfrmID  �Q  �P  �O  �N  �M  �L  �K   ascr  ��ޭ