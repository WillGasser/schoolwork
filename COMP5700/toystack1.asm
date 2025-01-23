
toystack1:     file format elf32-i386


Disassembly of section .init:

080484a4 <_init>:
 80484a4:	53                   	push   %ebx
 80484a5:	83 ec 08             	sub    $0x8,%esp
 80484a8:	e8 63 01 00 00       	call   8048610 <__x86.get_pc_thunk.bx>
 80484ad:	81 c3 53 1b 00 00    	add    $0x1b53,%ebx
 80484b3:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80484b9:	85 c0                	test   %eax,%eax
 80484bb:	74 05                	je     80484c2 <_init+0x1e>
 80484bd:	e8 ee 00 00 00       	call   80485b0 <__gmon_start__@plt>
 80484c2:	83 c4 08             	add    $0x8,%esp
 80484c5:	5b                   	pop    %ebx
 80484c6:	c3                   	ret    

Disassembly of section .plt:

080484d0 <.plt>:
 80484d0:	ff 35 04 a0 04 08    	pushl  0x804a004
 80484d6:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80484dc:	00 00                	add    %al,(%eax)
	...

080484e0 <setbuf@plt>:
 80484e0:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 80484e6:	68 00 00 00 00       	push   $0x0
 80484eb:	e9 e0 ff ff ff       	jmp    80484d0 <.plt>

080484f0 <read@plt>:
 80484f0:	ff 25 10 a0 04 08    	jmp    *0x804a010
 80484f6:	68 08 00 00 00       	push   $0x8
 80484fb:	e9 d0 ff ff ff       	jmp    80484d0 <.plt>

08048500 <printf@plt>:
 8048500:	ff 25 14 a0 04 08    	jmp    *0x804a014
 8048506:	68 10 00 00 00       	push   $0x10
 804850b:	e9 c0 ff ff ff       	jmp    80484d0 <.plt>

08048510 <puts@plt>:
 8048510:	ff 25 18 a0 04 08    	jmp    *0x804a018
 8048516:	68 18 00 00 00       	push   $0x18
 804851b:	e9 b0 ff ff ff       	jmp    80484d0 <.plt>

08048520 <sendfile@plt>:
 8048520:	ff 25 1c a0 04 08    	jmp    *0x804a01c
 8048526:	68 20 00 00 00       	push   $0x20
 804852b:	e9 a0 ff ff ff       	jmp    80484d0 <.plt>

08048530 <exit@plt>:
 8048530:	ff 25 20 a0 04 08    	jmp    *0x804a020
 8048536:	68 28 00 00 00       	push   $0x28
 804853b:	e9 90 ff ff ff       	jmp    80484d0 <.plt>

08048540 <open@plt>:
 8048540:	ff 25 24 a0 04 08    	jmp    *0x804a024
 8048546:	68 30 00 00 00       	push   $0x30
 804854b:	e9 80 ff ff ff       	jmp    80484d0 <.plt>

08048550 <strlen@plt>:
 8048550:	ff 25 28 a0 04 08    	jmp    *0x804a028
 8048556:	68 38 00 00 00       	push   $0x38
 804855b:	e9 70 ff ff ff       	jmp    80484d0 <.plt>

08048560 <__libc_start_main@plt>:
 8048560:	ff 25 2c a0 04 08    	jmp    *0x804a02c
 8048566:	68 40 00 00 00       	push   $0x40
 804856b:	e9 60 ff ff ff       	jmp    80484d0 <.plt>

08048570 <memset@plt>:
 8048570:	ff 25 30 a0 04 08    	jmp    *0x804a030
 8048576:	68 48 00 00 00       	push   $0x48
 804857b:	e9 50 ff ff ff       	jmp    80484d0 <.plt>

08048580 <putchar@plt>:
 8048580:	ff 25 34 a0 04 08    	jmp    *0x804a034
 8048586:	68 50 00 00 00       	push   $0x50
 804858b:	e9 40 ff ff ff       	jmp    80484d0 <.plt>

08048590 <close@plt>:
 8048590:	ff 25 38 a0 04 08    	jmp    *0x804a038
 8048596:	68 58 00 00 00       	push   $0x58
 804859b:	e9 30 ff ff ff       	jmp    80484d0 <.plt>

080485a0 <__assert_fail@plt>:
 80485a0:	ff 25 3c a0 04 08    	jmp    *0x804a03c
 80485a6:	68 60 00 00 00       	push   $0x60
 80485ab:	e9 20 ff ff ff       	jmp    80484d0 <.plt>

Disassembly of section .plt.got:

080485b0 <__gmon_start__@plt>:
 80485b0:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 80485b6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

080485c0 <_start>:
 80485c0:	31 ed                	xor    %ebp,%ebp
 80485c2:	5e                   	pop    %esi
 80485c3:	89 e1                	mov    %esp,%ecx
 80485c5:	83 e4 f0             	and    $0xfffffff0,%esp
 80485c8:	50                   	push   %eax
 80485c9:	54                   	push   %esp
 80485ca:	52                   	push   %edx
 80485cb:	e8 23 00 00 00       	call   80485f3 <_start+0x33>
 80485d0:	81 c3 30 1a 00 00    	add    $0x1a30,%ebx
 80485d6:	8d 83 b0 e9 ff ff    	lea    -0x1650(%ebx),%eax
 80485dc:	50                   	push   %eax
 80485dd:	8d 83 50 e9 ff ff    	lea    -0x16b0(%ebx),%eax
 80485e3:	50                   	push   %eax
 80485e4:	51                   	push   %ecx
 80485e5:	56                   	push   %esi
 80485e6:	c7 c0 81 87 04 08    	mov    $0x8048781,%eax
 80485ec:	50                   	push   %eax
 80485ed:	e8 6e ff ff ff       	call   8048560 <__libc_start_main@plt>
 80485f2:	f4                   	hlt    
 80485f3:	8b 1c 24             	mov    (%esp),%ebx
 80485f6:	c3                   	ret    
 80485f7:	66 90                	xchg   %ax,%ax
 80485f9:	66 90                	xchg   %ax,%ax
 80485fb:	66 90                	xchg   %ax,%ax
 80485fd:	66 90                	xchg   %ax,%ax
 80485ff:	90                   	nop

08048600 <_dl_relocate_static_pie>:
 8048600:	f3 c3                	repz ret 
 8048602:	66 90                	xchg   %ax,%ax
 8048604:	66 90                	xchg   %ax,%ax
 8048606:	66 90                	xchg   %ax,%ax
 8048608:	66 90                	xchg   %ax,%ax
 804860a:	66 90                	xchg   %ax,%ax
 804860c:	66 90                	xchg   %ax,%ax
 804860e:	66 90                	xchg   %ax,%ax

08048610 <__x86.get_pc_thunk.bx>:
 8048610:	8b 1c 24             	mov    (%esp),%ebx
 8048613:	c3                   	ret    
 8048614:	66 90                	xchg   %ax,%ax
 8048616:	66 90                	xchg   %ax,%ax
 8048618:	66 90                	xchg   %ax,%ax
 804861a:	66 90                	xchg   %ax,%ax
 804861c:	66 90                	xchg   %ax,%ax
 804861e:	66 90                	xchg   %ax,%ax

08048620 <deregister_tm_clones>:
 8048620:	b8 48 a0 04 08       	mov    $0x804a048,%eax
 8048625:	3d 48 a0 04 08       	cmp    $0x804a048,%eax
 804862a:	74 24                	je     8048650 <deregister_tm_clones+0x30>
 804862c:	b8 00 00 00 00       	mov    $0x0,%eax
 8048631:	85 c0                	test   %eax,%eax
 8048633:	74 1b                	je     8048650 <deregister_tm_clones+0x30>
 8048635:	55                   	push   %ebp
 8048636:	89 e5                	mov    %esp,%ebp
 8048638:	83 ec 14             	sub    $0x14,%esp
 804863b:	68 48 a0 04 08       	push   $0x804a048
 8048640:	ff d0                	call   *%eax
 8048642:	83 c4 10             	add    $0x10,%esp
 8048645:	c9                   	leave  
 8048646:	c3                   	ret    
 8048647:	89 f6                	mov    %esi,%esi
 8048649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048650:	f3 c3                	repz ret 
 8048652:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048660 <register_tm_clones>:
 8048660:	b8 48 a0 04 08       	mov    $0x804a048,%eax
 8048665:	2d 48 a0 04 08       	sub    $0x804a048,%eax
 804866a:	c1 f8 02             	sar    $0x2,%eax
 804866d:	89 c2                	mov    %eax,%edx
 804866f:	c1 ea 1f             	shr    $0x1f,%edx
 8048672:	01 d0                	add    %edx,%eax
 8048674:	d1 f8                	sar    %eax
 8048676:	74 20                	je     8048698 <register_tm_clones+0x38>
 8048678:	ba 00 00 00 00       	mov    $0x0,%edx
 804867d:	85 d2                	test   %edx,%edx
 804867f:	74 17                	je     8048698 <register_tm_clones+0x38>
 8048681:	55                   	push   %ebp
 8048682:	89 e5                	mov    %esp,%ebp
 8048684:	83 ec 10             	sub    $0x10,%esp
 8048687:	50                   	push   %eax
 8048688:	68 48 a0 04 08       	push   $0x804a048
 804868d:	ff d2                	call   *%edx
 804868f:	83 c4 10             	add    $0x10,%esp
 8048692:	c9                   	leave  
 8048693:	c3                   	ret    
 8048694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048698:	f3 c3                	repz ret 
 804869a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

080486a0 <__do_global_dtors_aux>:
 80486a0:	80 3d 88 a0 04 08 00 	cmpb   $0x0,0x804a088
 80486a7:	75 17                	jne    80486c0 <__do_global_dtors_aux+0x20>
 80486a9:	55                   	push   %ebp
 80486aa:	89 e5                	mov    %esp,%ebp
 80486ac:	83 ec 08             	sub    $0x8,%esp
 80486af:	e8 6c ff ff ff       	call   8048620 <deregister_tm_clones>
 80486b4:	c6 05 88 a0 04 08 01 	movb   $0x1,0x804a088
 80486bb:	c9                   	leave  
 80486bc:	c3                   	ret    
 80486bd:	8d 76 00             	lea    0x0(%esi),%esi
 80486c0:	f3 c3                	repz ret 
 80486c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80486c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080486d0 <frame_dummy>:
 80486d0:	55                   	push   %ebp
 80486d1:	89 e5                	mov    %esp,%ebp
 80486d3:	5d                   	pop    %ebp
 80486d4:	eb 8a                	jmp    8048660 <register_tm_clones>

080486d6 <init>:
 80486d6:	55                   	push   %ebp
 80486d7:	89 e5                	mov    %esp,%ebp
 80486d9:	83 ec 08             	sub    $0x8,%esp
 80486dc:	a1 80 a0 04 08       	mov    0x804a080,%eax
 80486e1:	83 ec 08             	sub    $0x8,%esp
 80486e4:	6a 00                	push   $0x0
 80486e6:	50                   	push   %eax
 80486e7:	e8 f4 fd ff ff       	call   80484e0 <setbuf@plt>
 80486ec:	83 c4 10             	add    $0x10,%esp
 80486ef:	a1 84 a0 04 08       	mov    0x804a084,%eax
 80486f4:	83 ec 08             	sub    $0x8,%esp
 80486f7:	6a 00                	push   $0x0
 80486f9:	50                   	push   %eax
 80486fa:	e8 e1 fd ff ff       	call   80484e0 <setbuf@plt>
 80486ff:	83 c4 10             	add    $0x10,%esp
 8048702:	a1 60 a0 04 08       	mov    0x804a060,%eax
 8048707:	83 ec 08             	sub    $0x8,%esp
 804870a:	6a 00                	push   $0x0
 804870c:	50                   	push   %eax
 804870d:	e8 ce fd ff ff       	call   80484e0 <setbuf@plt>
 8048712:	83 c4 10             	add    $0x10,%esp
 8048715:	90                   	nop
 8048716:	c9                   	leave  
 8048717:	c3                   	ret    

08048718 <win>:
 8048718:	55                   	push   %ebp
 8048719:	89 e5                	mov    %esp,%ebp
 804871b:	83 ec 08             	sub    $0x8,%esp
 804871e:	83 ec 0c             	sub    $0xc,%esp
 8048721:	68 d0 89 04 08       	push   $0x80489d0
 8048726:	e8 e5 fd ff ff       	call   8048510 <puts@plt>
 804872b:	83 c4 10             	add    $0x10,%esp
 804872e:	83 ec 08             	sub    $0x8,%esp
 8048731:	6a 00                	push   $0x0
 8048733:	68 ec 89 04 08       	push   $0x80489ec
 8048738:	e8 03 fe ff ff       	call   8048540 <open@plt>
 804873d:	83 c4 10             	add    $0x10,%esp
 8048740:	68 00 04 00 00       	push   $0x400
 8048745:	6a 00                	push   $0x0
 8048747:	50                   	push   %eax
 8048748:	6a 01                	push   $0x1
 804874a:	e8 d1 fd ff ff       	call   8048520 <sendfile@plt>
 804874f:	83 c4 10             	add    $0x10,%esp
 8048752:	83 ec 0c             	sub    $0xc,%esp
 8048755:	6a 00                	push   $0x0
 8048757:	e8 d4 fd ff ff       	call   8048530 <exit@plt>

0804875c <vuln>:
 804875c:	55                   	push   %ebp
 804875d:	89 e5                	mov    %esp,%ebp
 804875f:	81 ec c8 05 00 00    	sub    $0x5c8,%esp
 8048765:	83 ec 04             	sub    $0x4,%esp
 8048768:	68 c0 06 00 00       	push   $0x6c0
 804876d:	8d 85 38 fa ff ff    	lea    -0x5c8(%ebp),%eax
 8048773:	50                   	push   %eax
 8048774:	6a 00                	push   $0x0
 8048776:	e8 75 fd ff ff       	call   80484f0 <read@plt>
 804877b:	83 c4 10             	add    $0x10,%esp
 804877e:	90                   	nop
 804877f:	c9                   	leave  
 8048780:	c3                   	ret    

08048781 <main>:
 8048781:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048785:	83 e4 f0             	and    $0xfffffff0,%esp
 8048788:	ff 71 fc             	pushl  -0x4(%ecx)
 804878b:	55                   	push   %ebp
 804878c:	89 e5                	mov    %esp,%ebp
 804878e:	53                   	push   %ebx
 804878f:	51                   	push   %ecx
 8048790:	83 ec 10             	sub    $0x10,%esp
 8048793:	89 cb                	mov    %ecx,%ebx
 8048795:	83 3b 00             	cmpl   $0x0,(%ebx)
 8048798:	7f 16                	jg     80487b0 <main+0x2f>
 804879a:	68 9c 8c 04 08       	push   $0x8048c9c
 804879f:	6a 29                	push   $0x29
 80487a1:	68 f2 89 04 08       	push   $0x80489f2
 80487a6:	68 00 8a 04 08       	push   $0x8048a00
 80487ab:	e8 f0 fd ff ff       	call   80485a0 <__assert_fail@plt>
 80487b0:	83 ec 0c             	sub    $0xc,%esp
 80487b3:	68 09 8a 04 08       	push   $0x8048a09
 80487b8:	e8 53 fd ff ff       	call   8048510 <puts@plt>
 80487bd:	83 c4 10             	add    $0x10,%esp
 80487c0:	8b 43 04             	mov    0x4(%ebx),%eax
 80487c3:	8b 00                	mov    (%eax),%eax
 80487c5:	83 ec 08             	sub    $0x8,%esp
 80487c8:	50                   	push   %eax
 80487c9:	68 0d 8a 04 08       	push   $0x8048a0d
 80487ce:	e8 2d fd ff ff       	call   8048500 <printf@plt>
 80487d3:	83 c4 10             	add    $0x10,%esp
 80487d6:	83 ec 0c             	sub    $0xc,%esp
 80487d9:	68 09 8a 04 08       	push   $0x8048a09
 80487de:	e8 2d fd ff ff       	call   8048510 <puts@plt>
 80487e3:	83 c4 10             	add    $0x10,%esp
 80487e6:	83 ec 0c             	sub    $0xc,%esp
 80487e9:	6a 0a                	push   $0xa
 80487eb:	e8 90 fd ff ff       	call   8048580 <putchar@plt>
 80487f0:	83 c4 10             	add    $0x10,%esp
 80487f3:	83 ec 0c             	sub    $0xc,%esp
 80487f6:	68 24 8a 04 08       	push   $0x8048a24
 80487fb:	e8 10 fd ff ff       	call   8048510 <puts@plt>
 8048800:	83 c4 10             	add    $0x10,%esp
 8048803:	83 ec 0c             	sub    $0xc,%esp
 8048806:	68 6c 8a 04 08       	push   $0x8048a6c
 804880b:	e8 00 fd ff ff       	call   8048510 <puts@plt>
 8048810:	83 c4 10             	add    $0x10,%esp
 8048813:	83 ec 0c             	sub    $0xc,%esp
 8048816:	68 c0 8a 04 08       	push   $0x8048ac0
 804881b:	e8 f0 fc ff ff       	call   8048510 <puts@plt>
 8048820:	83 c4 10             	add    $0x10,%esp
 8048823:	83 ec 0c             	sub    $0xc,%esp
 8048826:	68 18 8b 04 08       	push   $0x8048b18
 804882b:	e8 e0 fc ff ff       	call   8048510 <puts@plt>
 8048830:	83 c4 10             	add    $0x10,%esp
 8048833:	83 ec 0c             	sub    $0xc,%esp
 8048836:	68 6c 8b 04 08       	push   $0x8048b6c
 804883b:	e8 d0 fc ff ff       	call   8048510 <puts@plt>
 8048840:	83 c4 10             	add    $0x10,%esp
 8048843:	83 ec 0c             	sub    $0xc,%esp
 8048846:	68 bf 8b 04 08       	push   $0x8048bbf
 804884b:	e8 c0 fc ff ff       	call   8048510 <puts@plt>
 8048850:	83 c4 10             	add    $0x10,%esp
 8048853:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
 804885a:	eb 12                	jmp    804886e <main+0xed>
 804885c:	83 ec 0c             	sub    $0xc,%esp
 804885f:	ff 75 f4             	pushl  -0xc(%ebp)
 8048862:	e8 29 fd ff ff       	call   8048590 <close@plt>
 8048867:	83 c4 10             	add    $0x10,%esp
 804886a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804886e:	81 7d f4 0f 27 00 00 	cmpl   $0x270f,-0xc(%ebp)
 8048875:	7e e5                	jle    804885c <main+0xdb>
 8048877:	8b 43 04             	mov    0x4(%ebx),%eax
 804887a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804887d:	eb 2b                	jmp    80488aa <main+0x129>
 804887f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048882:	8b 00                	mov    (%eax),%eax
 8048884:	83 ec 0c             	sub    $0xc,%esp
 8048887:	50                   	push   %eax
 8048888:	e8 c3 fc ff ff       	call   8048550 <strlen@plt>
 804888d:	83 c4 10             	add    $0x10,%esp
 8048890:	89 c2                	mov    %eax,%edx
 8048892:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048895:	8b 00                	mov    (%eax),%eax
 8048897:	83 ec 04             	sub    $0x4,%esp
 804889a:	52                   	push   %edx
 804889b:	6a 00                	push   $0x0
 804889d:	50                   	push   %eax
 804889e:	e8 cd fc ff ff       	call   8048570 <memset@plt>
 80488a3:	83 c4 10             	add    $0x10,%esp
 80488a6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
 80488aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80488ad:	8b 00                	mov    (%eax),%eax
 80488af:	85 c0                	test   %eax,%eax
 80488b1:	75 cc                	jne    804887f <main+0xfe>
 80488b3:	8b 43 08             	mov    0x8(%ebx),%eax
 80488b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80488b9:	eb 2b                	jmp    80488e6 <main+0x165>
 80488bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80488be:	8b 00                	mov    (%eax),%eax
 80488c0:	83 ec 0c             	sub    $0xc,%esp
 80488c3:	50                   	push   %eax
 80488c4:	e8 87 fc ff ff       	call   8048550 <strlen@plt>
 80488c9:	83 c4 10             	add    $0x10,%esp
 80488cc:	89 c2                	mov    %eax,%edx
 80488ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80488d1:	8b 00                	mov    (%eax),%eax
 80488d3:	83 ec 04             	sub    $0x4,%esp
 80488d6:	52                   	push   %edx
 80488d7:	6a 00                	push   $0x0
 80488d9:	50                   	push   %eax
 80488da:	e8 91 fc ff ff       	call   8048570 <memset@plt>
 80488df:	83 c4 10             	add    $0x10,%esp
 80488e2:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
 80488e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80488e9:	8b 00                	mov    (%eax),%eax
 80488eb:	85 c0                	test   %eax,%eax
 80488ed:	75 cc                	jne    80488bb <main+0x13a>
 80488ef:	83 ec 0c             	sub    $0xc,%esp
 80488f2:	68 d0 8b 04 08       	push   $0x8048bd0
 80488f7:	e8 14 fc ff ff       	call   8048510 <puts@plt>
 80488fc:	83 c4 10             	add    $0x10,%esp
 80488ff:	83 ec 0c             	sub    $0xc,%esp
 8048902:	68 20 8c 04 08       	push   $0x8048c20
 8048907:	e8 04 fc ff ff       	call   8048510 <puts@plt>
 804890c:	83 c4 10             	add    $0x10,%esp
 804890f:	83 ec 0c             	sub    $0xc,%esp
 8048912:	68 78 8c 04 08       	push   $0x8048c78
 8048917:	e8 f4 fb ff ff       	call   8048510 <puts@plt>
 804891c:	83 c4 10             	add    $0x10,%esp
 804891f:	83 ec 04             	sub    $0x4,%esp
 8048922:	ff 73 08             	pushl  0x8(%ebx)
 8048925:	ff 73 04             	pushl  0x4(%ebx)
 8048928:	ff 33                	pushl  (%ebx)
 804892a:	e8 2d fe ff ff       	call   804875c <vuln>
 804892f:	83 c4 10             	add    $0x10,%esp
 8048932:	b8 00 00 00 00       	mov    $0x0,%eax
 8048937:	8d 65 f8             	lea    -0x8(%ebp),%esp
 804893a:	59                   	pop    %ecx
 804893b:	5b                   	pop    %ebx
 804893c:	5d                   	pop    %ebp
 804893d:	8d 61 fc             	lea    -0x4(%ecx),%esp
 8048940:	c3                   	ret    
 8048941:	66 90                	xchg   %ax,%ax
 8048943:	66 90                	xchg   %ax,%ax
 8048945:	66 90                	xchg   %ax,%ax
 8048947:	66 90                	xchg   %ax,%ax
 8048949:	66 90                	xchg   %ax,%ax
 804894b:	66 90                	xchg   %ax,%ax
 804894d:	66 90                	xchg   %ax,%ax
 804894f:	90                   	nop

08048950 <__libc_csu_init>:
 8048950:	55                   	push   %ebp
 8048951:	57                   	push   %edi
 8048952:	56                   	push   %esi
 8048953:	53                   	push   %ebx
 8048954:	e8 b7 fc ff ff       	call   8048610 <__x86.get_pc_thunk.bx>
 8048959:	81 c3 a7 16 00 00    	add    $0x16a7,%ebx
 804895f:	83 ec 0c             	sub    $0xc,%esp
 8048962:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 8048966:	8d b3 10 ff ff ff    	lea    -0xf0(%ebx),%esi
 804896c:	e8 33 fb ff ff       	call   80484a4 <_init>
 8048971:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 8048977:	29 c6                	sub    %eax,%esi
 8048979:	c1 fe 02             	sar    $0x2,%esi
 804897c:	85 f6                	test   %esi,%esi
 804897e:	74 25                	je     80489a5 <__libc_csu_init+0x55>
 8048980:	31 ff                	xor    %edi,%edi
 8048982:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048988:	83 ec 04             	sub    $0x4,%esp
 804898b:	55                   	push   %ebp
 804898c:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048990:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048994:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 804899b:	83 c7 01             	add    $0x1,%edi
 804899e:	83 c4 10             	add    $0x10,%esp
 80489a1:	39 fe                	cmp    %edi,%esi
 80489a3:	75 e3                	jne    8048988 <__libc_csu_init+0x38>
 80489a5:	83 c4 0c             	add    $0xc,%esp
 80489a8:	5b                   	pop    %ebx
 80489a9:	5e                   	pop    %esi
 80489aa:	5f                   	pop    %edi
 80489ab:	5d                   	pop    %ebp
 80489ac:	c3                   	ret    
 80489ad:	8d 76 00             	lea    0x0(%esi),%esi

080489b0 <__libc_csu_fini>:
 80489b0:	f3 c3                	repz ret 

Disassembly of section .fini:

080489b4 <_fini>:
 80489b4:	53                   	push   %ebx
 80489b5:	83 ec 08             	sub    $0x8,%esp
 80489b8:	e8 53 fc ff ff       	call   8048610 <__x86.get_pc_thunk.bx>
 80489bd:	81 c3 43 16 00 00    	add    $0x1643,%ebx
 80489c3:	83 c4 08             	add    $0x8,%esp
 80489c6:	5b                   	pop    %ebx
 80489c7:	c3                   	ret    
