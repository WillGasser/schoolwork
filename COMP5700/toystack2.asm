
./toystack2:     file format elf32-i386


Disassembly of section .init:

00000744 <_init>:
 744:	53                   	push   %ebx
 745:	83 ec 08             	sub    $0x8,%esp
 748:	e8 53 01 00 00       	call   8a0 <__x86.get_pc_thunk.bx>
 74d:	81 c3 5f 28 00 00    	add    $0x285f,%ebx
 753:	8b 83 48 00 00 00    	mov    0x48(%ebx),%eax
 759:	85 c0                	test   %eax,%eax
 75b:	74 05                	je     762 <_init+0x1e>
 75d:	e8 f6 00 00 00       	call   858 <__gmon_start__@plt>
 762:	83 c4 08             	add    $0x8,%esp
 765:	5b                   	pop    %ebx
 766:	c3                   	ret    

Disassembly of section .plt:

00000770 <.plt>:
 770:	ff b3 04 00 00 00    	push   0x4(%ebx)
 776:	ff a3 08 00 00 00    	jmp    *0x8(%ebx)
 77c:	00 00                	add    %al,(%eax)
	...

00000780 <setbuf@plt>:
 780:	ff a3 0c 00 00 00    	jmp    *0xc(%ebx)
 786:	68 00 00 00 00       	push   $0x0
 78b:	e9 e0 ff ff ff       	jmp    770 <.plt>

00000790 <read@plt>:
 790:	ff a3 10 00 00 00    	jmp    *0x10(%ebx)
 796:	68 08 00 00 00       	push   $0x8
 79b:	e9 d0 ff ff ff       	jmp    770 <.plt>

000007a0 <printf@plt>:
 7a0:	ff a3 14 00 00 00    	jmp    *0x14(%ebx)
 7a6:	68 10 00 00 00       	push   $0x10
 7ab:	e9 c0 ff ff ff       	jmp    770 <.plt>

000007b0 <puts@plt>:
 7b0:	ff a3 18 00 00 00    	jmp    *0x18(%ebx)
 7b6:	68 18 00 00 00       	push   $0x18
 7bb:	e9 b0 ff ff ff       	jmp    770 <.plt>

000007c0 <sendfile@plt>:
 7c0:	ff a3 1c 00 00 00    	jmp    *0x1c(%ebx)
 7c6:	68 20 00 00 00       	push   $0x20
 7cb:	e9 a0 ff ff ff       	jmp    770 <.plt>

000007d0 <exit@plt>:
 7d0:	ff a3 20 00 00 00    	jmp    *0x20(%ebx)
 7d6:	68 28 00 00 00       	push   $0x28
 7db:	e9 90 ff ff ff       	jmp    770 <.plt>

000007e0 <open@plt>:
 7e0:	ff a3 24 00 00 00    	jmp    *0x24(%ebx)
 7e6:	68 30 00 00 00       	push   $0x30
 7eb:	e9 80 ff ff ff       	jmp    770 <.plt>

000007f0 <strlen@plt>:
 7f0:	ff a3 28 00 00 00    	jmp    *0x28(%ebx)
 7f6:	68 38 00 00 00       	push   $0x38
 7fb:	e9 70 ff ff ff       	jmp    770 <.plt>

00000800 <__libc_start_main@plt>:
 800:	ff a3 2c 00 00 00    	jmp    *0x2c(%ebx)
 806:	68 40 00 00 00       	push   $0x40
 80b:	e9 60 ff ff ff       	jmp    770 <.plt>

00000810 <memset@plt>:
 810:	ff a3 30 00 00 00    	jmp    *0x30(%ebx)
 816:	68 48 00 00 00       	push   $0x48
 81b:	e9 50 ff ff ff       	jmp    770 <.plt>

00000820 <putchar@plt>:
 820:	ff a3 34 00 00 00    	jmp    *0x34(%ebx)
 826:	68 50 00 00 00       	push   $0x50
 82b:	e9 40 ff ff ff       	jmp    770 <.plt>

00000830 <close@plt>:
 830:	ff a3 38 00 00 00    	jmp    *0x38(%ebx)
 836:	68 58 00 00 00       	push   $0x58
 83b:	e9 30 ff ff ff       	jmp    770 <.plt>

00000840 <__assert_fail@plt>:
 840:	ff a3 3c 00 00 00    	jmp    *0x3c(%ebx)
 846:	68 60 00 00 00       	push   $0x60
 84b:	e9 20 ff ff ff       	jmp    770 <.plt>

Disassembly of section .plt.got:

00000850 <__cxa_finalize@plt>:
 850:	ff a3 44 00 00 00    	jmp    *0x44(%ebx)
 856:	66 90                	xchg   %ax,%ax

00000858 <__gmon_start__@plt>:
 858:	ff a3 48 00 00 00    	jmp    *0x48(%ebx)
 85e:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000860 <_start>:
 860:	31 ed                	xor    %ebp,%ebp
 862:	5e                   	pop    %esi
 863:	89 e1                	mov    %esp,%ecx
 865:	83 e4 f0             	and    $0xfffffff0,%esp
 868:	50                   	push   %eax
 869:	54                   	push   %esp
 86a:	52                   	push   %edx
 86b:	e8 22 00 00 00       	call   892 <_start+0x32>
 870:	81 c3 3c 27 00 00    	add    $0x273c,%ebx
 876:	8d 83 14 dd ff ff    	lea    -0x22ec(%ebx),%eax
 87c:	50                   	push   %eax
 87d:	8d 83 b4 dc ff ff    	lea    -0x234c(%ebx),%eax
 883:	50                   	push   %eax
 884:	51                   	push   %ecx
 885:	56                   	push   %esi
 886:	ff b3 4c 00 00 00    	push   0x4c(%ebx)
 88c:	e8 6f ff ff ff       	call   800 <__libc_start_main@plt>
 891:	f4                   	hlt    
 892:	8b 1c 24             	mov    (%esp),%ebx
 895:	c3                   	ret    
 896:	66 90                	xchg   %ax,%ax
 898:	66 90                	xchg   %ax,%ax
 89a:	66 90                	xchg   %ax,%ax
 89c:	66 90                	xchg   %ax,%ax
 89e:	66 90                	xchg   %ax,%ax

000008a0 <__x86.get_pc_thunk.bx>:
 8a0:	8b 1c 24             	mov    (%esp),%ebx
 8a3:	c3                   	ret    
 8a4:	66 90                	xchg   %ax,%ax
 8a6:	66 90                	xchg   %ax,%ax
 8a8:	66 90                	xchg   %ax,%ax
 8aa:	66 90                	xchg   %ax,%ax
 8ac:	66 90                	xchg   %ax,%ax
 8ae:	66 90                	xchg   %ax,%ax

000008b0 <deregister_tm_clones>:
 8b0:	e8 e4 00 00 00       	call   999 <__x86.get_pc_thunk.dx>
 8b5:	81 c2 f7 26 00 00    	add    $0x26f7,%edx
 8bb:	8d 8a 5c 00 00 00    	lea    0x5c(%edx),%ecx
 8c1:	8d 82 5c 00 00 00    	lea    0x5c(%edx),%eax
 8c7:	39 c8                	cmp    %ecx,%eax
 8c9:	74 1d                	je     8e8 <deregister_tm_clones+0x38>
 8cb:	8b 82 40 00 00 00    	mov    0x40(%edx),%eax
 8d1:	85 c0                	test   %eax,%eax
 8d3:	74 13                	je     8e8 <deregister_tm_clones+0x38>
 8d5:	55                   	push   %ebp
 8d6:	89 e5                	mov    %esp,%ebp
 8d8:	83 ec 14             	sub    $0x14,%esp
 8db:	51                   	push   %ecx
 8dc:	ff d0                	call   *%eax
 8de:	83 c4 10             	add    $0x10,%esp
 8e1:	c9                   	leave  
 8e2:	c3                   	ret    
 8e3:	90                   	nop
 8e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8e8:	f3 c3                	repz ret 
 8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008f0 <register_tm_clones>:
 8f0:	e8 a4 00 00 00       	call   999 <__x86.get_pc_thunk.dx>
 8f5:	81 c2 b7 26 00 00    	add    $0x26b7,%edx
 8fb:	55                   	push   %ebp
 8fc:	8d 8a 5c 00 00 00    	lea    0x5c(%edx),%ecx
 902:	8d 82 5c 00 00 00    	lea    0x5c(%edx),%eax
 908:	29 c8                	sub    %ecx,%eax
 90a:	89 e5                	mov    %esp,%ebp
 90c:	53                   	push   %ebx
 90d:	c1 f8 02             	sar    $0x2,%eax
 910:	89 c3                	mov    %eax,%ebx
 912:	83 ec 04             	sub    $0x4,%esp
 915:	c1 eb 1f             	shr    $0x1f,%ebx
 918:	01 d8                	add    %ebx,%eax
 91a:	d1 f8                	sar    %eax
 91c:	74 14                	je     932 <register_tm_clones+0x42>
 91e:	8b 92 50 00 00 00    	mov    0x50(%edx),%edx
 924:	85 d2                	test   %edx,%edx
 926:	74 0a                	je     932 <register_tm_clones+0x42>
 928:	83 ec 08             	sub    $0x8,%esp
 92b:	50                   	push   %eax
 92c:	51                   	push   %ecx
 92d:	ff d2                	call   *%edx
 92f:	83 c4 10             	add    $0x10,%esp
 932:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 935:	c9                   	leave  
 936:	c3                   	ret    
 937:	89 f6                	mov    %esi,%esi
 939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000940 <__do_global_dtors_aux>:
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	53                   	push   %ebx
 944:	e8 57 ff ff ff       	call   8a0 <__x86.get_pc_thunk.bx>
 949:	81 c3 63 26 00 00    	add    $0x2663,%ebx
 94f:	83 ec 04             	sub    $0x4,%esp
 952:	80 bb 9c 00 00 00 00 	cmpb   $0x0,0x9c(%ebx)
 959:	75 27                	jne    982 <__do_global_dtors_aux+0x42>
 95b:	8b 83 44 00 00 00    	mov    0x44(%ebx),%eax
 961:	85 c0                	test   %eax,%eax
 963:	74 11                	je     976 <__do_global_dtors_aux+0x36>
 965:	83 ec 0c             	sub    $0xc,%esp
 968:	ff b3 58 00 00 00    	push   0x58(%ebx)
 96e:	e8 dd fe ff ff       	call   850 <__cxa_finalize@plt>
 973:	83 c4 10             	add    $0x10,%esp
 976:	e8 35 ff ff ff       	call   8b0 <deregister_tm_clones>
 97b:	c6 83 9c 00 00 00 01 	movb   $0x1,0x9c(%ebx)
 982:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 985:	c9                   	leave  
 986:	c3                   	ret    
 987:	89 f6                	mov    %esi,%esi
 989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000990 <frame_dummy>:
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	5d                   	pop    %ebp
 994:	e9 57 ff ff ff       	jmp    8f0 <register_tm_clones>

00000999 <__x86.get_pc_thunk.dx>:
 999:	8b 14 24             	mov    (%esp),%edx
 99c:	c3                   	ret    

0000099d <init>:
 99d:	55                   	push   %ebp
 99e:	89 e5                	mov    %esp,%ebp
 9a0:	83 ec 08             	sub    $0x8,%esp
 9a3:	a1 00 00 00 00       	mov    0x0,%eax
 9a8:	83 ec 08             	sub    $0x8,%esp
 9ab:	6a 00                	push   $0x0
 9ad:	50                   	push   %eax
 9ae:	e8 fc ff ff ff       	call   9af <init+0x12>
 9b3:	83 c4 10             	add    $0x10,%esp
 9b6:	a1 00 00 00 00       	mov    0x0,%eax
 9bb:	83 ec 08             	sub    $0x8,%esp
 9be:	6a 00                	push   $0x0
 9c0:	50                   	push   %eax
 9c1:	e8 fc ff ff ff       	call   9c2 <init+0x25>
 9c6:	83 c4 10             	add    $0x10,%esp
 9c9:	a1 00 00 00 00       	mov    0x0,%eax
 9ce:	83 ec 08             	sub    $0x8,%esp
 9d1:	6a 00                	push   $0x0
 9d3:	50                   	push   %eax
 9d4:	e8 fc ff ff ff       	call   9d5 <init+0x38>
 9d9:	83 c4 10             	add    $0x10,%esp
 9dc:	90                   	nop
 9dd:	c9                   	leave  
 9de:	c3                   	ret    

000009df <win>:
 9df:	55                   	push   %ebp
 9e0:	89 e5                	mov    %esp,%ebp
 9e2:	83 ec 08             	sub    $0x8,%esp
 9e5:	83 ec 0c             	sub    $0xc,%esp
 9e8:	68 e0 0c 00 00       	push   $0xce0
 9ed:	e8 fc ff ff ff       	call   9ee <win+0xf>
 9f2:	83 c4 10             	add    $0x10,%esp
 9f5:	83 ec 08             	sub    $0x8,%esp
 9f8:	6a 00                	push   $0x0
 9fa:	68 fc 0c 00 00       	push   $0xcfc
 9ff:	e8 fc ff ff ff       	call   a00 <win+0x21>
 a04:	83 c4 10             	add    $0x10,%esp
 a07:	68 00 04 00 00       	push   $0x400
 a0c:	6a 00                	push   $0x0
 a0e:	50                   	push   %eax
 a0f:	6a 01                	push   $0x1
 a11:	e8 fc ff ff ff       	call   a12 <win+0x33>
 a16:	83 c4 10             	add    $0x10,%esp
 a19:	83 ec 0c             	sub    $0xc,%esp
 a1c:	6a 00                	push   $0x0
 a1e:	e8 fc ff ff ff       	call   a1f <win+0x40>

00000a23 <vuln>:
 a23:	55                   	push   %ebp
 a24:	89 e5                	mov    %esp,%ebp
 a26:	81 ec 18 03 00 00    	sub    $0x318,%esp
 a2c:	83 ec 0c             	sub    $0xc,%esp
 a2f:	68 02 0d 00 00       	push   $0xd02
 a34:	e8 fc ff ff ff       	call   a35 <vuln+0x12>
 a39:	83 c4 10             	add    $0x10,%esp
 a3c:	8b 45 0c             	mov    0xc(%ebp),%eax
 a3f:	8b 00                	mov    (%eax),%eax
 a41:	83 ec 08             	sub    $0x8,%esp
 a44:	50                   	push   %eax
 a45:	68 06 0d 00 00       	push   $0xd06
 a4a:	e8 fc ff ff ff       	call   a4b <vuln+0x28>
 a4f:	83 c4 10             	add    $0x10,%esp
 a52:	83 ec 0c             	sub    $0xc,%esp
 a55:	68 02 0d 00 00       	push   $0xd02
 a5a:	e8 fc ff ff ff       	call   a5b <vuln+0x38>
 a5f:	83 c4 10             	add    $0x10,%esp
 a62:	83 ec 0c             	sub    $0xc,%esp
 a65:	6a 0a                	push   $0xa
 a67:	e8 fc ff ff ff       	call   a68 <vuln+0x45>
 a6c:	83 c4 10             	add    $0x10,%esp
 a6f:	83 ec 0c             	sub    $0xc,%esp
 a72:	68 1c 0d 00 00       	push   $0xd1c
 a77:	e8 fc ff ff ff       	call   a78 <vuln+0x55>
 a7c:	83 c4 10             	add    $0x10,%esp
 a7f:	83 ec 0c             	sub    $0xc,%esp
 a82:	68 64 0d 00 00       	push   $0xd64
 a87:	e8 fc ff ff ff       	call   a88 <vuln+0x65>
 a8c:	83 c4 10             	add    $0x10,%esp
 a8f:	83 ec 0c             	sub    $0xc,%esp
 a92:	68 b8 0d 00 00       	push   $0xdb8
 a97:	e8 fc ff ff ff       	call   a98 <vuln+0x75>
 a9c:	83 c4 10             	add    $0x10,%esp
 a9f:	83 ec 0c             	sub    $0xc,%esp
 aa2:	68 10 0e 00 00       	push   $0xe10
 aa7:	e8 fc ff ff ff       	call   aa8 <vuln+0x85>
 aac:	83 c4 10             	add    $0x10,%esp
 aaf:	83 ec 0c             	sub    $0xc,%esp
 ab2:	68 64 0e 00 00       	push   $0xe64
 ab7:	e8 fc ff ff ff       	call   ab8 <vuln+0x95>
 abc:	83 c4 10             	add    $0x10,%esp
 abf:	83 ec 0c             	sub    $0xc,%esp
 ac2:	68 b7 0e 00 00       	push   $0xeb7
 ac7:	e8 fc ff ff ff       	call   ac8 <vuln+0xa5>
 acc:	83 c4 10             	add    $0x10,%esp
 acf:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
 ad6:	eb 12                	jmp    aea <vuln+0xc7>
 ad8:	83 ec 0c             	sub    $0xc,%esp
 adb:	ff 75 f4             	push   -0xc(%ebp)
 ade:	e8 fc ff ff ff       	call   adf <vuln+0xbc>
 ae3:	83 c4 10             	add    $0x10,%esp
 ae6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 aea:	81 7d f4 0f 27 00 00 	cmpl   $0x270f,-0xc(%ebp)
 af1:	7e e5                	jle    ad8 <vuln+0xb5>
 af3:	8b 45 0c             	mov    0xc(%ebp),%eax
 af6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 af9:	eb 2b                	jmp    b26 <vuln+0x103>
 afb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 afe:	8b 00                	mov    (%eax),%eax
 b00:	83 ec 0c             	sub    $0xc,%esp
 b03:	50                   	push   %eax
 b04:	e8 fc ff ff ff       	call   b05 <vuln+0xe2>
 b09:	83 c4 10             	add    $0x10,%esp
 b0c:	89 c2                	mov    %eax,%edx
 b0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b11:	8b 00                	mov    (%eax),%eax
 b13:	83 ec 04             	sub    $0x4,%esp
 b16:	52                   	push   %edx
 b17:	6a 00                	push   $0x0
 b19:	50                   	push   %eax
 b1a:	e8 fc ff ff ff       	call   b1b <vuln+0xf8>
 b1f:	83 c4 10             	add    $0x10,%esp
 b22:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
 b26:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b29:	8b 00                	mov    (%eax),%eax
 b2b:	85 c0                	test   %eax,%eax
 b2d:	75 cc                	jne    afb <vuln+0xd8>
 b2f:	8b 45 10             	mov    0x10(%ebp),%eax
 b32:	89 45 ec             	mov    %eax,-0x14(%ebp)
 b35:	eb 2b                	jmp    b62 <vuln+0x13f>
 b37:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b3a:	8b 00                	mov    (%eax),%eax
 b3c:	83 ec 0c             	sub    $0xc,%esp
 b3f:	50                   	push   %eax
 b40:	e8 fc ff ff ff       	call   b41 <vuln+0x11e>
 b45:	83 c4 10             	add    $0x10,%esp
 b48:	89 c2                	mov    %eax,%edx
 b4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b4d:	8b 00                	mov    (%eax),%eax
 b4f:	83 ec 04             	sub    $0x4,%esp
 b52:	52                   	push   %edx
 b53:	6a 00                	push   $0x0
 b55:	50                   	push   %eax
 b56:	e8 fc ff ff ff       	call   b57 <vuln+0x134>
 b5b:	83 c4 10             	add    $0x10,%esp
 b5e:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
 b62:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b65:	8b 00                	mov    (%eax),%eax
 b67:	85 c0                	test   %eax,%eax
 b69:	75 cc                	jne    b37 <vuln+0x114>
 b6b:	83 ec 0c             	sub    $0xc,%esp
 b6e:	68 c8 0e 00 00       	push   $0xec8
 b73:	e8 fc ff ff ff       	call   b74 <vuln+0x151>
 b78:	83 c4 10             	add    $0x10,%esp
 b7b:	83 ec 0c             	sub    $0xc,%esp
 b7e:	68 18 0f 00 00       	push   $0xf18
 b83:	e8 fc ff ff ff       	call   b84 <vuln+0x161>
 b88:	83 c4 10             	add    $0x10,%esp
 b8b:	83 ec 0c             	sub    $0xc,%esp
 b8e:	68 70 0f 00 00       	push   $0xf70
 b93:	e8 fc ff ff ff       	call   b94 <vuln+0x171>
 b98:	83 c4 10             	add    $0x10,%esp
 b9b:	83 ec 0c             	sub    $0xc,%esp
 b9e:	68 bc 0f 00 00       	push   $0xfbc
 ba3:	e8 fc ff ff ff       	call   ba4 <vuln+0x181>
 ba8:	83 c4 10             	add    $0x10,%esp
 bab:	83 ec 0c             	sub    $0xc,%esp
 bae:	68 f8 0f 00 00       	push   $0xff8
 bb3:	e8 fc ff ff ff       	call   bb4 <vuln+0x191>
 bb8:	83 c4 10             	add    $0x10,%esp
 bbb:	83 ec 0c             	sub    $0xc,%esp
 bbe:	68 4c 10 00 00       	push   $0x104c
 bc3:	e8 fc ff ff ff       	call   bc4 <vuln+0x1a1>
 bc8:	83 c4 10             	add    $0x10,%esp
 bcb:	83 ec 0c             	sub    $0xc,%esp
 bce:	68 a0 10 00 00       	push   $0x10a0
 bd3:	e8 fc ff ff ff       	call   bd4 <vuln+0x1b1>
 bd8:	83 c4 10             	add    $0x10,%esp
 bdb:	83 ec 0c             	sub    $0xc,%esp
 bde:	68 d0 10 00 00       	push   $0x10d0
 be3:	e8 fc ff ff ff       	call   be4 <vuln+0x1c1>
 be8:	83 c4 10             	add    $0x10,%esp
 beb:	83 ec 04             	sub    $0x4,%esp
 bee:	68 00 04 00 00       	push   $0x400
 bf3:	8d 85 ec fc ff ff    	lea    -0x314(%ebp),%eax
 bf9:	50                   	push   %eax
 bfa:	6a 00                	push   $0x0
 bfc:	e8 fc ff ff ff       	call   bfd <vuln+0x1da>
 c01:	83 c4 10             	add    $0x10,%esp
 c04:	90                   	nop
 c05:	c9                   	leave  
 c06:	c3                   	ret    

00000c07 <main>:
 c07:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 c0b:	83 e4 f0             	and    $0xfffffff0,%esp
 c0e:	ff 71 fc             	push   -0x4(%ecx)
 c11:	55                   	push   %ebp
 c12:	89 e5                	mov    %esp,%ebp
 c14:	51                   	push   %ecx
 c15:	83 ec 04             	sub    $0x4,%esp
 c18:	89 c8                	mov    %ecx,%eax
 c1a:	83 38 00             	cmpl   $0x0,(%eax)
 c1d:	7f 16                	jg     c35 <main+0x2e>
 c1f:	68 0c 11 00 00       	push   $0x110c
 c24:	6a 4a                	push   $0x4a
 c26:	68 f2 10 00 00       	push   $0x10f2
 c2b:	68 00 11 00 00       	push   $0x1100
 c30:	e8 fc ff ff ff       	call   c31 <main+0x2a>
 c35:	83 ec 04             	sub    $0x4,%esp
 c38:	ff 70 08             	push   0x8(%eax)
 c3b:	ff 70 04             	push   0x4(%eax)
 c3e:	ff 30                	push   (%eax)
 c40:	e8 de fd ff ff       	call   a23 <vuln>
 c45:	83 c4 10             	add    $0x10,%esp
 c48:	b8 00 00 00 00       	mov    $0x0,%eax
 c4d:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 c50:	c9                   	leave  
 c51:	8d 61 fc             	lea    -0x4(%ecx),%esp
 c54:	c3                   	ret    
 c55:	66 90                	xchg   %ax,%ax
 c57:	66 90                	xchg   %ax,%ax
 c59:	66 90                	xchg   %ax,%ax
 c5b:	66 90                	xchg   %ax,%ax
 c5d:	66 90                	xchg   %ax,%ax
 c5f:	90                   	nop

00000c60 <__libc_csu_init>:
 c60:	55                   	push   %ebp
 c61:	57                   	push   %edi
 c62:	56                   	push   %esi
 c63:	53                   	push   %ebx
 c64:	e8 37 fc ff ff       	call   8a0 <__x86.get_pc_thunk.bx>
 c69:	81 c3 43 23 00 00    	add    $0x2343,%ebx
 c6f:	83 ec 0c             	sub    $0xc,%esp
 c72:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 c76:	8d b3 fc fe ff ff    	lea    -0x104(%ebx),%esi
 c7c:	e8 c3 fa ff ff       	call   744 <_init>
 c81:	8d 83 f4 fe ff ff    	lea    -0x10c(%ebx),%eax
 c87:	29 c6                	sub    %eax,%esi
 c89:	c1 fe 02             	sar    $0x2,%esi
 c8c:	85 f6                	test   %esi,%esi
 c8e:	74 25                	je     cb5 <__libc_csu_init+0x55>
 c90:	31 ff                	xor    %edi,%edi
 c92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 c98:	83 ec 04             	sub    $0x4,%esp
 c9b:	55                   	push   %ebp
 c9c:	ff 74 24 2c          	push   0x2c(%esp)
 ca0:	ff 74 24 2c          	push   0x2c(%esp)
 ca4:	ff 94 bb f4 fe ff ff 	call   *-0x10c(%ebx,%edi,4)
 cab:	83 c7 01             	add    $0x1,%edi
 cae:	83 c4 10             	add    $0x10,%esp
 cb1:	39 fe                	cmp    %edi,%esi
 cb3:	75 e3                	jne    c98 <__libc_csu_init+0x38>
 cb5:	83 c4 0c             	add    $0xc,%esp
 cb8:	5b                   	pop    %ebx
 cb9:	5e                   	pop    %esi
 cba:	5f                   	pop    %edi
 cbb:	5d                   	pop    %ebp
 cbc:	c3                   	ret    
 cbd:	8d 76 00             	lea    0x0(%esi),%esi

00000cc0 <__libc_csu_fini>:
 cc0:	f3 c3                	repz ret 

Disassembly of section .fini:

00000cc4 <_fini>:
 cc4:	53                   	push   %ebx
 cc5:	83 ec 08             	sub    $0x8,%esp
 cc8:	e8 d3 fb ff ff       	call   8a0 <__x86.get_pc_thunk.bx>
 ccd:	81 c3 df 22 00 00    	add    $0x22df,%ebx
 cd3:	83 c4 08             	add    $0x8,%esp
 cd6:	5b                   	pop    %ebx
 cd7:	c3                   	ret    
