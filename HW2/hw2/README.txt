1. �{�����e: 

*�Nr1-r4�Ȧs�����O�s�J���P���ƭȡA�A�p��r0 = r1*r2 + r3*r4�C

//=====================================
���O����:

mov s1 #n : 

�N�ƭ�n�s��s1�Ȧs�����C 

mul s1 s2 s3 :

�Ns2�Ms3�Ȧs�����Ȭۭ��s��s1�Ȧs���A�ݭn�`�N���O�s�J���Ȧs������O�ۭ��ʧ@�U�Ĥ@�ӫ��w���Ȧs���C

ADD s1 s2 s3

�Ns2�Ms3�Ȧs�����Ȭۥ[�s��s1�Ȧs���C
//======================================

2. �p��sĶ�{��: 

*��J���Oarm-none-eabi-gcc -g -O0 hw2.s �Vo \ hw2.exe�C

//======================================
���~�T��:

collect2.exe: error: ld returned 1 exit status

�ѨM�覡:

�[�J --specs �ѼơC
//======================================


3. �{����������: 

*windows powershell�C

//======================================
powershell���Ұt�m�y�{
1. �U��arm-toolchain for windows�C
2. �Nvim�Marm�����u���new-alias����W�A��K�H��ϥ�(���Ψϥε�����|)�C
3. �U��arm-none-eabi-insight�C

ref: https://l.facebook.com/l.php?u=http%3A%2F%2Fwww.wowotech.net%2Fsoft%2Fvim_in_powershell.html%3Ffbclid%3DIwAR3opSSHMybSFLdU224nqVtqeFkEtKOfHVsS8PxLnO1LH0BICynfJ0uqz4s&h=AT0WcibpPwrqzideERQfBqaBV02TGX6n0GkUF79sD-DDm6x-zXaEdSZNfZSPDhHBl1KqCqaRQWnCbhoGWK21fLDPh80PKaPlb7RlcvJ-j2VmpDKYNIsnQveFPpbplaRPUwiDCA
//======================================


4. �[��Ȧs���ƭ��ܤ�:

*arm-none-eabi-insight�A�]�w�A���_�I(breakpoint)�H��A�i�v�����d��regiter���ȱo�ܤơC

