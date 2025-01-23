
./toystack3:     file format elf32-i386


Disassembly of section .init:

0000076c <_init>:
 76c:	53                   	push   %ebx
 76d:	83 ec 08             	sub    $0x8,%esp
 770:	e8 4b 01 00 00       	call   8c0 <__x86.get_pc_thunk.bx>
 775:	81 c3 37 28 00 00    	add    $0x2837,%ebx
 77b:	8b 83 48 00 00 00    	mov    0x48(%ebx),%eax
 781:	85 c0                	test   %eax,%eax
 783:	74 05                	je     78a <_init+0x1e>
 785:	e8 ee 00 00 00       	call   878 <__gmon_start__@plt>
 78a:	83 c4 08             	add    $0x8,%esp
 78d:	5b                   	pop    %ebx
 78e:	c3                   	ret    

Disassembly of section .plt:

00000790 <.plt>:
 790:	ff b3 04 00 00 00    	push   0x4(%ebx)
 796:	ff a3 08 00 00 00    	jmp    *0x8(%ebx)
 79c:	00 00                	add    %al,(%eax)
	...

000007a0 <setbuf@plt>:
 7a0:	ff a3 0c 00 00 00    	jmp    *0xc(%ebx)
 7a6:	68 00 00 00 00       	push   $0x0
 7ab:	e9 e0 ff ff ff       	jmp    790 <.plt>

000007b0 <read@plt>:
 7b0:	ff a3 10 00 00 00    	jmp    *0x10(%ebx)
 7b6:	68 08 00 00 00       	push   $0x8
 7bb:	e9 d0 ff ff ff       	jmp    790 <.plt>

000007c0 <printf@plt>:
 7c0:	ff a3 14 00 00 00    	jmp    *0x14(%ebx)
 7c6:	68 10 00 00 00       	push   $0x10
 7cb:	e9 c0 ff ff ff       	jmp    790 <.plt>

000007d0 <puts@plt>:
 7d0:	ff a3 18 00 00 00    	jmp    *0x18(%ebx)
 7d6:	68 18 00 00 00       	push   $0x18
 7db:	e9 b0 ff ff ff       	jmp    790 <.plt>

000007e0 <sendfile@plt>:
 7e0:	ff a3 1c 00 00 00    	jmp    *0x1c(%ebx)
 7e6:	68 20 00 00 00       	push   $0x20
 7eb:	e9 a0 ff ff ff       	jmp    790 <.plt>

000007f0 <exit@plt>:
 7f0:	ff a3 20 00 00 00    	jmp    *0x20(%ebx)
 7f6:	68 28 00 00 00       	push   $0x28
 7fb:	e9 90 ff ff ff       	jmp    790 <.plt>

00000800 <open@plt>:
 800:	ff a3 24 00 00 00    	jmp    *0x24(%ebx)
 806:	68 30 00 00 00       	push   $0x30
 80b:	e9 80 ff ff ff       	jmp    790 <.plt>

00000810 <strlen@plt>:
 810:	ff a3 28 00 00 00    	jmp    *0x28(%ebx)
 816:	68 38 00 00 00       	push   $0x38
 81b:	e9 70 ff ff ff       	jmp    790 <.plt>

00000820 <__libc_start_main@plt>:
 820:	ff a3 2c 00 00 00    	jmp    *0x2c(%ebx)
 826:	68 40 00 00 00       	push   $0x40
 82b:	e9 60 ff ff ff       	jmp    790 <.plt>

00000830 <memset@plt>:
 830:	ff a3 30 00 00 00    	jmp    *0x30(%ebx)
 836:	68 48 00 00 00       	push   $0x48
 83b:	e9 50 ff ff ff       	jmp    790 <.plt>

00000840 <putchar@plt>:
 840:	ff a3 34 00 00 00    	jmp    *0x34(%ebx)
 846:	68 50 00 00 00       	push   $0x50
 84b:	e9 40 ff ff ff       	jmp    790 <.plt>

00000850 <close@plt>:
 850:	ff a3 38 00 00 00    	jmp    *0x38(%ebx)
 856:	68 58 00 00 00       	push   $0x58
 85b:	e9 30 ff ff ff       	jmp    790 <.plt>

00000860 <__assert_fail@plt>:
 860:	ff a3 3c 00 00 00    	jmp    *0x3c(%ebx)
 866:	68 60 00 00 00       	push   $0x60
 86b:	e9 20 ff ff ff       	jmp    790 <.plt>

Disassembly of section .plt.got:

00000870 <__cxa_finalize@plt>:
 870:	ff a3 44 00 00 00    	jmp    *0x44(%ebx)
 876:	66 90                	xchg   %ax,%ax

00000878 <__gmon_start__@plt>:
 878:	ff a3 48 00 00 00    	jmp    *0x48(%ebx)
 87e:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000880 <_start>:
 880:	31 ed                	xor    %ebp,%ebp
 882:	5e                   	pop    %esi
 883:	89 e1                	mov    %esp,%ecx
 885:	83 e4 f0             	and    $0xfffffff0,%esp
 888:	50                   	push   %eax
 889:	54                   	push   %esp
 88a:	52                   	push   %edx
 88b:	e8 22 00 00 00       	call   8b2 <_start+0x32>
 890:	81 c3 1c 27 00 00    	add    $0x271c,%ebx
 896:	8d 83 64 dd ff ff    	lea    -0x229c(%ebx),%eax
 89c:	50                   	push   %eax
 89d:	8d 83 04 dd ff ff    	lea    -0x22fc(%ebx),%eax
 8a3:	50                   	push   %eax
 8a4:	51                   	push   %ecx
 8a5:	56                   	push   %esi
 8a6:	ff b3 4c 00 00 00    	push   0x4c(%ebx)
 8ac:	e8 6f ff ff ff       	call   820 <__libc_start_main@plt>
 8b1:	f4                   	hlt    
 8b2:	8b 1c 24             	mov    (%esp),%ebx
 8b5:	c3                   	ret    
 8b6:	66 90                	xchg   %ax,%ax
 8b8:	66 90                	xchg   %ax,%ax
 8ba:	66 90                	xchg   %ax,%ax
 8bc:	66 90                	xchg   %ax,%ax
 8be:	66 90                	xchg   %ax,%ax

000008c0 <__x86.get_pc_thunk.bx>:
 8c0:	8b 1c 24             	mov    (%esp),%ebx
 8c3:	c3                   	ret    
 8c4:	66 90                	xchg   %ax,%ax
 8c6:	66 90                	xchg   %ax,%ax
 8c8:	66 90                	xchg   %ax,%ax
 8ca:	66 90                	xchg   %ax,%ax
 8cc:	66 90                	xchg   %ax,%ax
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <deregister_tm_clones>:
 8d0:	e8 e4 00 00 00       	call   9b9 <__x86.get_pc_thunk.dx>
 8d5:	81 c2 d7 26 00 00    	add    $0x26d7,%edx
 8db:	8d 8a 5c 00 00 00    	lea    0x5c(%edx),%ecx
 8e1:	8d 82 5c 00 00 00    	lea    0x5c(%edx),%eax
 8e7:	39 c8                	cmp    %ecx,%eax
 8e9:	74 1d                	je     908 <deregister_tm_clones+0x38>
 8eb:	8b 82 40 00 00 00    	mov    0x40(%edx),%eax
 8f1:	85 c0                	test   %eax,%eax
 8f3:	74 13                	je     908 <deregister_tm_clones+0x38>
 8f5:	55                   	push   %ebp
 8f6:	89 e5                	mov    %esp,%ebp
 8f8:	83 ec 14             	sub    $0x14,%esp
 8fb:	51                   	push   %ecx
 8fc:	ff d0                	call   *%eax
 8fe:	83 c4 10             	add    $0x10,%esp
 901:	c9                   	leave  
 902:	c3                   	ret    
 903:	90                   	nop
 904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 908:	f3 c3                	repz ret 
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000910 <register_tm_clones>:
 910:	e8 a4 00 00 00       	call   9b9 <__x86.get_pc_thunk.dx>
 915:	81 c2 97 26 00 00    	add    $0x2697,%edx
 91b:	55                   	push   %ebp
 91c:	8d 8a 5c 00 00 00    	lea    0x5c(%edx),%ecx
 922:	8d 82 5c 00 00 00    	lea    0x5c(%edx),%eax
 928:	29 c8                	sub    %ecx,%eax
 92a:	89 e5                	mov    %esp,%ebp
 92c:	53                   	push   %ebx
 92d:	c1 f8 02             	sar    $0x2,%eax
 930:	89 c3                	mov    %eax,%ebx
 932:	83 ec 04             	sub    $0x4,%esp
 935:	c1 eb 1f             	shr    $0x1f,%ebx
 938:	01 d8                	add    %ebx,%eax
 93a:	d1 f8                	sar    %eax
 93c:	74 14                	je     952 <register_tm_clones+0x42>
 93e:	8b 92 50 00 00 00    	mov    0x50(%edx),%edx
 944:	85 d2                	test   %edx,%edx
 946:	74 0a                	je     952 <register_tm_clones+0x42>
 948:	83 ec 08             	sub    $0x8,%esp
 94b:	50                   	push   %eax
 94c:	51                   	push   %ecx
 94d:	ff d2                	call   *%edx
 94f:	83 c4 10             	add    $0x10,%esp
 952:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 955:	c9                   	leave  
 956:	c3                   	ret    
 957:	89 f6                	mov    %esi,%esi
 959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000960 <__do_global_dtors_aux>:
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	53                   	push   %ebx
 964:	e8 57 ff ff ff       	call   8c0 <__x86.get_pc_thunk.bx>
 969:	81 c3 43 26 00 00    	add    $0x2643,%ebx
 96f:	83 ec 04             	sub    $0x4,%esp
 972:	80 bb 9c 00 00 00 00 	cmpb   $0x0,0x9c(%ebx)
 979:	75 27                	jne    9a2 <__do_global_dtors_aux+0x42>
 97b:	8b 83 44 00 00 00    	mov    0x44(%ebx),%eax
 981:	85 c0                	test   %eax,%eax
 983:	74 11                	je     996 <__do_global_dtors_aux+0x36>
 985:	83 ec 0c             	sub    $0xc,%esp
 988:	ff b3 58 00 00 00    	push   0x58(%ebx)
 98e:	e8 dd fe ff ff       	call   870 <__cxa_finalize@plt>
 993:	83 c4 10             	add    $0x10,%esp
 996:	e8 35 ff ff ff       	call   8d0 <deregister_tm_clones>
 99b:	c6 83 9c 00 00 00 01 	movb   $0x1,0x9c(%ebx)
 9a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9a5:	c9                   	leave  
 9a6:	c3                   	ret    
 9a7:	89 f6                	mov    %esi,%esi
 9a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009b0 <frame_dummy>:
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	5d                   	pop    %ebp
 9b4:	e9 57 ff ff ff       	jmp    910 <register_tm_clones>

000009b9 <__x86.get_pc_thunk.dx>:
 9b9:	8b 14 24             	mov    (%esp),%edx
 9bc:	c3                   	ret    

000009bd <init>:
 9bd:	55                   	push   %ebp
 9be:	89 e5                	mov    %esp,%ebp
 9c0:	83 ec 08             	sub    $0x8,%esp
 9c3:	a1 00 00 00 00       	mov    0x0,%eax
 9c8:	83 ec 08             	sub    $0x8,%esp
 9cb:	6a 00                	push   $0x0
 9cd:	50                   	push   %eax
 9ce:	e8 fc ff ff ff       	call   9cf <init+0x12>
 9d3:	83 c4 10             	add    $0x10,%esp
 9d6:	a1 00 00 00 00       	mov    0x0,%eax
 9db:	83 ec 08             	sub    $0x8,%esp
 9de:	6a 00                	push   $0x0
 9e0:	50                   	push   %eax
 9e1:	e8 fc ff ff ff       	call   9e2 <init+0x25>
 9e6:	83 c4 10             	add    $0x10,%esp
 9e9:	a1 00 00 00 00       	mov    0x0,%eax
 9ee:	83 ec 08             	sub    $0x8,%esp
 9f1:	6a 00                	push   $0x0
 9f3:	50                   	push   %eax
 9f4:	e8 fc ff ff ff       	call   9f5 <init+0x38>
 9f9:	83 c4 10             	add    $0x10,%esp
 9fc:	90                   	nop
 9fd:	c9                   	leave  
 9fe:	c3                   	ret    

000009ff <win>:
 9ff:	55                   	push   %ebp
 a00:	89 e5                	mov    %esp,%ebp
 a02:	83 ec 08             	sub    $0x8,%esp
 a05:	81 7d 08 37 13 00 00 	cmpl   $0x1337,0x8(%ebp)
 a0c:	74 1a                	je     a28 <win+0x29>
 a0e:	83 ec 0c             	sub    $0xc,%esp
 a11:	68 30 0d 00 00       	push   $0xd30
 a16:	e8 fc ff ff ff       	call   a17 <win+0x18>
 a1b:	83 c4 10             	add    $0x10,%esp
 a1e:	83 ec 0c             	sub    $0xc,%esp
 a21:	6a 00                	push   $0x0
 a23:	e8 fc ff ff ff       	call   a24 <win+0x25>
 a28:	83 ec 0c             	sub    $0xc,%esp
 a2b:	68 48 0d 00 00       	push   $0xd48
 a30:	e8 fc ff ff ff       	call   a31 <win+0x32>
 a35:	83 c4 10             	add    $0x10,%esp
 a38:	83 ec 08             	sub    $0x8,%esp
 a3b:	6a 00                	push   $0x0
 a3d:	68 64 0d 00 00       	push   $0xd64
 a42:	e8 fc ff ff ff       	call   a43 <win+0x44>
 a47:	83 c4 10             	add    $0x10,%esp
 a4a:	68 00 04 00 00       	push   $0x400
 a4f:	6a 00                	push   $0x0
 a51:	50                   	push   %eax
 a52:	6a 01                	push   $0x1
 a54:	e8 fc ff ff ff       	call   a55 <win+0x56>
 a59:	83 c4 10             	add    $0x10,%esp
 a5c:	83 ec 0c             	sub    $0xc,%esp
 a5f:	6a 00                	push   $0x0
 a61:	e8 fc ff ff ff       	call   a62 <win+0x63>

00000a66 <vuln>:
 a66:	55                   	push   %ebp
 a67:	89 e5                	mov    %esp,%ebp
 a69:	81 ec 48 04 00 00    	sub    $0x448,%esp
 a6f:	83 ec 0c             	sub    $0xc,%esp
 a72:	68 6a 0d 00 00       	push   $0xd6a
 a77:	e8 fc ff ff ff       	call   a78 <vuln+0x12>
 a7c:	83 c4 10             	add    $0x10,%esp
 a7f:	8b 45 0c             	mov    0xc(%ebp),%eax
 a82:	8b 00                	mov    (%eax),%eax
 a84:	83 ec 08             	sub    $0x8,%esp
 a87:	50                   	push   %eax
 a88:	68 6e 0d 00 00       	push   $0xd6e
 a8d:	e8 fc ff ff ff       	call   a8e <vuln+0x28>
 a92:	83 c4 10             	add    $0x10,%esp
 a95:	83 ec 0c             	sub    $0xc,%esp
 a98:	68 6a 0d 00 00       	push   $0xd6a
 a9d:	e8 fc ff ff ff       	call   a9e <vuln+0x38>
 aa2:	83 c4 10             	add    $0x10,%esp
 aa5:	83 ec 0c             	sub    $0xc,%esp
 aa8:	6a 0a                	push   $0xa
 aaa:	e8 fc ff ff ff       	call   aab <vuln+0x45>
 aaf:	83 c4 10             	add    $0x10,%esp
 ab2:	83 ec 0c             	sub    $0xc,%esp
 ab5:	68 84 0d 00 00       	push   $0xd84
 aba:	e8 fc ff ff ff       	call   abb <vuln+0x55>
 abf:	83 c4 10             	add    $0x10,%esp
 ac2:	83 ec 0c             	sub    $0xc,%esp
 ac5:	68 cc 0d 00 00       	push   $0xdcc
 aca:	e8 fc ff ff ff       	call   acb <vuln+0x65>
 acf:	83 c4 10             	add    $0x10,%esp
 ad2:	83 ec 0c             	sub    $0xc,%esp
 ad5:	68 20 0e 00 00       	push   $0xe20
 ada:	e8 fc ff ff ff       	call   adb <vuln+0x75>
 adf:	83 c4 10             	add    $0x10,%esp
 ae2:	83 ec 0c             	sub    $0xc,%esp
 ae5:	68 78 0e 00 00       	push   $0xe78
 aea:	e8 fc ff ff ff       	call   aeb <vuln+0x85>
 aef:	83 c4 10             	add    $0x10,%esp
 af2:	83 ec 0c             	sub    $0xc,%esp
 af5:	68 cc 0e 00 00       	push   $0xecc
 afa:	e8 fc ff ff ff       	call   afb <vuln+0x95>
 aff:	83 c4 10             	add    $0x10,%esp
 b02:	83 ec 0c             	sub    $0xc,%esp
 b05:	68 1f 0f 00 00       	push   $0xf1f
 b0a:	e8 fc ff ff ff       	call   b0b <vuln+0xa5>
 b0f:	83 c4 10             	add    $0x10,%esp
 b12:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
 b19:	eb 12                	jmp    b2d <vuln+0xc7>
 b1b:	83 ec 0c             	sub    $0xc,%esp
 b1e:	ff 75 f4             	push   -0xc(%ebp)
 b21:	e8 fc ff ff ff       	call   b22 <vuln+0xbc>
 b26:	83 c4 10             	add    $0x10,%esp
 b29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 b2d:	81 7d f4 0f 27 00 00 	cmpl   $0x270f,-0xc(%ebp)
 b34:	7e e5                	jle    b1b <vuln+0xb5>
 b36:	8b 45 0c             	mov    0xc(%ebp),%eax
 b39:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b3c:	eb 2b                	jmp    b69 <vuln+0x103>
 b3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b41:	8b 00                	mov    (%eax),%eax
 b43:	83 ec 0c             	sub    $0xc,%esp
 b46:	50                   	push   %eax
 b47:	e8 fc ff ff ff       	call   b48 <vuln+0xe2>
 b4c:	83 c4 10             	add    $0x10,%esp
 b4f:	89 c2                	mov    %eax,%edx
 b51:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b54:	8b 00                	mov    (%eax),%eax
 b56:	83 ec 04             	sub    $0x4,%esp
 b59:	52                   	push   %edx
 b5a:	6a 00                	push   $0x0
 b5c:	50                   	push   %eax
 b5d:	e8 fc ff ff ff       	call   b5e <vuln+0xf8>
 b62:	83 c4 10             	add    $0x10,%esp
 b65:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
 b69:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b6c:	8b 00                	mov    (%eax),%eax
 b6e:	85 c0                	test   %eax,%eax
 b70:	75 cc                	jne    b3e <vuln+0xd8>
 b72:	8b 45 10             	mov    0x10(%ebp),%eax
 b75:	89 45 ec             	mov    %eax,-0x14(%ebp)
 b78:	eb 2b                	jmp    ba5 <vuln+0x13f>
 b7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b7d:	8b 00                	mov    (%eax),%eax
 b7f:	83 ec 0c             	sub    $0xc,%esp
 b82:	50                   	push   %eax
 b83:	e8 fc ff ff ff       	call   b84 <vuln+0x11e>
 b88:	83 c4 10             	add    $0x10,%esp
 b8b:	89 c2                	mov    %eax,%edx
 b8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b90:	8b 00                	mov    (%eax),%eax
 b92:	83 ec 04             	sub    $0x4,%esp
 b95:	52                   	push   %edx
 b96:	6a 00                	push   $0x0
 b98:	50                   	push   %eax
 b99:	e8 fc ff ff ff       	call   b9a <vuln+0x134>
 b9e:	83 c4 10             	add    $0x10,%esp
 ba1:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
 ba5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ba8:	8b 00                	mov    (%eax),%eax
 baa:	85 c0                	test   %eax,%eax
 bac:	75 cc                	jne    b7a <vuln+0x114>
 bae:	83 ec 0c             	sub    $0xc,%esp
 bb1:	68 30 0f 00 00       	push   $0xf30
 bb6:	e8 fc ff ff ff       	call   bb7 <vuln+0x151>
 bbb:	83 c4 10             	add    $0x10,%esp
 bbe:	83 ec 0c             	sub    $0xc,%esp
 bc1:	68 7c 0f 00 00       	push   $0xf7c
 bc6:	e8 fc ff ff ff       	call   bc7 <vuln+0x161>
 bcb:	83 c4 10             	add    $0x10,%esp
 bce:	83 ec 0c             	sub    $0xc,%esp
 bd1:	68 b8 0f 00 00       	push   $0xfb8
 bd6:	e8 fc ff ff ff       	call   bd7 <vuln+0x171>
 bdb:	83 c4 10             	add    $0x10,%esp
 bde:	83 ec 0c             	sub    $0xc,%esp
 be1:	68 0c 10 00 00       	push   $0x100c
 be6:	e8 fc ff ff ff       	call   be7 <vuln+0x181>
 beb:	83 c4 10             	add    $0x10,%esp
 bee:	83 ec 0c             	sub    $0xc,%esp
 bf1:	68 60 10 00 00       	push   $0x1060
 bf6:	e8 fc ff ff ff       	call   bf7 <vuln+0x191>
 bfb:	83 c4 10             	add    $0x10,%esp
 bfe:	83 ec 0c             	sub    $0xc,%esp
 c01:	68 90 10 00 00       	push   $0x1090
 c06:	e8 fc ff ff ff       	call   c07 <vuln+0x1a1>
 c0b:	83 c4 10             	add    $0x10,%esp
 c0e:	83 ec 0c             	sub    $0xc,%esp
 c11:	68 e4 10 00 00       	push   $0x10e4
 c16:	e8 fc ff ff ff       	call   c17 <vuln+0x1b1>
 c1b:	83 c4 10             	add    $0x10,%esp
 c1e:	83 ec 0c             	sub    $0xc,%esp
 c21:	68 34 11 00 00       	push   $0x1134
 c26:	e8 fc ff ff ff       	call   c27 <vuln+0x1c1>
 c2b:	83 c4 10             	add    $0x10,%esp
 c2e:	83 ec 0c             	sub    $0xc,%esp
 c31:	68 74 11 00 00       	push   $0x1174
 c36:	e8 fc ff ff ff       	call   c37 <vuln+0x1d1>
 c3b:	83 c4 10             	add    $0x10,%esp
 c3e:	83 ec 04             	sub    $0x4,%esp
 c41:	68 30 05 00 00       	push   $0x530
 c46:	8d 85 bc fb ff ff    	lea    -0x444(%ebp),%eax
 c4c:	50                   	push   %eax
 c4d:	6a 00                	push   $0x0
 c4f:	e8 fc ff ff ff       	call   c50 <vuln+0x1ea>
 c54:	83 c4 10             	add    $0x10,%esp
 c57:	90                   	nop
 c58:	c9                   	leave  
 c59:	c3                   	ret    

00000c5a <main>:
 c5a:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 c5e:	83 e4 f0             	and    $0xfffffff0,%esp
 c61:	ff 71 fc             	push   -0x4(%ecx)
 c64:	55                   	push   %ebp
 c65:	89 e5                	mov    %esp,%ebp
 c67:	51                   	push   %ecx
 c68:	83 ec 04             	sub    $0x4,%esp
 c6b:	89 c8                	mov    %ecx,%eax
 c6d:	83 38 00             	cmpl   $0x0,(%eax)
 c70:	7f 16                	jg     c88 <main+0x2e>
 c72:	68 b0 11 00 00       	push   $0x11b0
 c77:	6a 52                	push   $0x52
 c79:	68 96 11 00 00       	push   $0x1196
 c7e:	68 a4 11 00 00       	push   $0x11a4
 c83:	e8 fc ff ff ff       	call   c84 <main+0x2a>
 c88:	83 ec 04             	sub    $0x4,%esp
 c8b:	ff 70 08             	push   0x8(%eax)
 c8e:	ff 70 04             	push   0x4(%eax)
 c91:	ff 30                	push   (%eax)
 c93:	e8 ce fd ff ff       	call   a66 <vuln>
 c98:	83 c4 10             	add    $0x10,%esp
 c9b:	b8 00 00 00 00       	mov    $0x0,%eax
 ca0:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 ca3:	c9                   	leave  
 ca4:	8d 61 fc             	lea    -0x4(%ecx),%esp
 ca7:	c3                   	ret    
 ca8:	66 90                	xchg   %ax,%ax
 caa:	66 90                	xchg   %ax,%ax
 cac:	66 90                	xchg   %ax,%ax
 cae:	66 90                	xchg   %ax,%ax

00000cb0 <__libc_csu_init>:
 cb0:	55                   	push   %ebp
 cb1:	57                   	push   %edi
 cb2:	56                   	push   %esi
 cb3:	53                   	push   %ebx
 cb4:	e8 07 fc ff ff       	call   8c0 <__x86.get_pc_thunk.bx>
 cb9:	81 c3 f3 22 00 00    	add    $0x22f3,%ebx
 cbf:	83 ec 0c             	sub    $0xc,%esp
 cc2:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 cc6:	8d b3 fc fe ff ff    	lea    -0x104(%ebx),%esi
 ccc:	e8 9b fa ff ff       	call   76c <_init>
 cd1:	8d 83 f4 fe ff ff    	lea    -0x10c(%ebx),%eax
 cd7:	29 c6                	sub    %eax,%esi
 cd9:	c1 fe 02             	sar    $0x2,%esi
 cdc:	85 f6                	test   %esi,%esi
 cde:	74 25                	je     d05 <__libc_csu_init+0x55>
 ce0:	31 ff                	xor    %edi,%edi
 ce2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 ce8:	83 ec 04             	sub    $0x4,%esp
 ceb:	55                   	push   %ebp
 cec:	ff 74 24 2c          	push   0x2c(%esp)
 cf0:	ff 74 24 2c          	push   0x2c(%esp)
 cf4:	ff 94 bb f4 fe ff ff 	call   *-0x10c(%ebx,%edi,4)
 cfb:	83 c7 01             	add    $0x1,%edi
 cfe:	83 c4 10             	add    $0x10,%esp
 d01:	39 fe                	cmp    %edi,%esi
 d03:	75 e3                	jne    ce8 <__libc_csu_init+0x38>
 d05:	83 c4 0c             	add    $0xc,%esp
 d08:	5b                   	pop    %ebx
 d09:	5e                   	pop    %esi
 d0a:	5f                   	pop    %edi
 d0b:	5d                   	pop    %ebp
 d0c:	c3                   	ret    
 d0d:	8d 76 00             	lea    0x0(%esi),%esi

00000d10 <__libc_csu_fini>:
 d10:	f3 c3                	repz ret 

Disassembly of section .fini:

00000d14 <_fini>:
 d14:	53                   	push   %ebx
 d15:	83 ec 08             	sub    $0x8,%esp
 d18:	e8 a3 fb ff ff       	call   8c0 <__x86.get_pc_thunk.bx>
 d1d:	81 c3 8f 22 00 00    	add    $0x228f,%ebx
 d23:	83 c4 08             	add    $0x8,%esp
 d26:	5b                   	pop    %ebx
 d27:	c3                   	ret    
