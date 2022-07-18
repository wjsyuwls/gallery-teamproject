---------------------------------------------------------------------
-- artFairMain
create table artFairsMain(
    mainimg_src VARCHAR(500),
    afdate VARCHAR(50),
    title VARCHAR(50),
    
    info_date VARCHAR(50),
    info VARCHAR(50),
    detailimg_src VARCHAR(500),
    place VARCHAR(50),
    place_detail VARCHAR(50),
    artists VARCHAR(50),
    artist_name VARCHAR(500),
    
    img_src1 VARCHAR(500),
    img_src2 VARCHAR(500),
    img_src3 VARCHAR(500)
);
select * from artFairsMain;

delete artFairsMain where title is null;

insert into artFairsMain values ('https://static.wixstatic.com/media/520ee6_487df069f6f1465195cc6914a0b0fe57~mv2.jpg/v1/crop/x_0,y_41,w_1500,h_1418/fill/w_220,h_208,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/epost3_edited_edited_edited.jpg', 
'2021.11.30 - 2021.12.05', 'CONTEXT Art Miami 2021', 'November 30 - December 5, 2021', 'DOWNTOWN MIAMI ON BISCAYNE BAY', 'https://static.wixstatic.com/media/520ee6_824de45f7182446591dd417ea4cbeb31~mv2.jpg/v1/fill/w_687,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_824de45f7182446591dd417ea4cbeb31~mv2.jpg', 
'GALLERY BK', 'Booth Number : B20', 'Participating Artists :', 'KANG Hyung Koo<br>KWON Yong Rae<br>BAHK Seon Ghi<br>PARK Jong Kyu<br>LEE Gil Rae<br>LEE Sea Hyun<br>WOO Kuk Won<br>JANG Seung Taik<br>HAN Jae Yeol', 
'https://static.wixstatic.com/media/520ee6_e3e466075c15470e927b601ae601d45f~mv2.jpg/v1/fill/w_687,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_e3e466075c15470e927b601ae601d45f~mv2.jpg', 
'https://static.wixstatic.com/media/520ee6_a4717bbcd07840e08511ed4a60989acd~mv2.jpg/v1/fill/w_687,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_a4717bbcd07840e08511ed4a60989acd~mv2.jpg', 
'https://static.wixstatic.com/media/520ee6_be53e46f33004098818386577769afd4~mv2.jpg/v1/fill/w_687,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_be53e46f33004098818386577769afd4~mv2.jpg');

insert into artFairsMain values ('https://static.wixstatic.com/media/520ee6_7ca67e5b411149d1b8d0669249e9d131~mv2.jpg/v1/crop/x_37,y_0,w_377,h_360/fill/w_220,h_208,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/marc-straus-art-central-2018-a.jpg', 
'2018.03.27 - 2018.04.01', 'Art Central HK 2018', 'Mar 27 - April 1, 2018', 'Central Harborfront, HONG KONG', 'https://static.wixstatic.com/media/520ee6_53bce3a1fc5f488fae4632d523d1192a~mv2_d_2000_1477_s_2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_53bce3a1fc5f488fae4632d523d1192a~mv2_d_2000_1477_s_2.jpg', 
'GALLERY BK', 'Booth Number : D-16', 'Participating Artists :', 'BAHK Seon Ghi<br>LEE Sang Yong<br>WOO Kuk Won<br>PARK Hee Seop', 
'https://static.wixstatic.com/media/520ee6_b0360b589c6b4415ac5a236f2851d7fb~mv2_d_2000_1500_s_2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_b0360b589c6b4415ac5a236f2851d7fb~mv2_d_2000_1500_s_2.jpg', 
'', 
'');

insert into artFairsMain values ('https://static.wixstatic.com/media/520ee6_96888b06daaa444d8a8a6299b89f25c2~mv2.jpg/v1/crop/x_0,y_97,w_320,h_305/fill/w_220,h_208,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/20160107110133_PAINTING_gb_gseoul14%20(1)_.jpg', 
'2014.05.08 - 2014.05.11', 'G Seoul International Art Fair 2014', 'May 9 - May 11, 2014', 'Dream Design Play, DDP, Seoul, Korea', 'https://static.wixstatic.com/media/520ee6_72d0ce2f2c7c4d09a8ae5df79da32ecc~mv2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_72d0ce2f2c7c4d09a8ae5df79da32ecc~mv2.jpg', 
'GALLERY BK', 'Booth Number : C-26', 'Participating Artists :', 'LEE Sang Yong', 
'https://static.wixstatic.com/media/520ee6_9616756551854a109128bf582b015e54~mv2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_9616756551854a109128bf582b015e54~mv2.jpg', 
'https://static.wixstatic.com/media/520ee6_cf150fca404b4ae69c95eaa91cba63ab~mv2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_cf150fca404b4ae69c95eaa91cba63ab~mv2.jpg', 
'');

insert into artFairsMain values ('https://static.wixstatic.com/media/520ee6_213d5288fe654022a436d353cfb7b1dc~mv2.png/v1/crop/x_0,y_22,w_960,h_916/fill/w_220,h_208,al_c,usm_0.66_1.00_0.01,enc_auto/50818624_2726871453997650_84772261675925.png', 
'2019.12.03 - 2019.12.08', 'CONTEXT Art Miami 2019', 'December 3 - December 8, 2019', 'DOWNTOWN MIAMI ON BISCAYNE BAY', 'https://static.wixstatic.com/media/520ee6_9908709339d7487aa86c6172a72ef6ba~mv2_d_5616_3744_s_4_2.jpg/v1/fill/w_687,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_9908709339d7487aa86c6172a72ef6ba~mv2_d_5616_3744_s_4_2.jpg', 
'GALLERY BK', 'Booth Number : B21', 'Participating Artists :', 'BAHK Seon Ghi<br>SONG Eun Young<br>WOO Kuk Won<br>Mila LIGHTS', 
'https://static.wixstatic.com/media/520ee6_e4a967f6b3c3413dadfbc53748d667a7~mv2_d_5616_3744_s_4_2.jpg/v1/fill/w_687,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_e4a967f6b3c3413dadfbc53748d667a7~mv2_d_5616_3744_s_4_2.jpg', 
'https://static.wixstatic.com/media/520ee6_5e852947eb524ab7a35a89a1826748c9~mv2_d_5616_3744_s_4_2.jpg/v1/fill/w_687,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_5e852947eb524ab7a35a89a1826748c9~mv2_d_5616_3744_s_4_2.jpg', 
'https://static.wixstatic.com/media/520ee6_d70db7e1921c4d2aaff8b8f3cc0bc56a~mv2.jpg/v1/fill/w_687,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_d70db7e1921c4d2aaff8b8f3cc0bc56a~mv2.jpg');

insert into artFairsMain values ('https://static.wixstatic.com/media/520ee6_7e35cd72b51f4b1a9d21677ec6b8b78f~mv2.jpg/v1/crop/x_68,y_0,w_503,h_480/fill/w_220,h_208,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/art%20central%20for%20web_2.jpg', 
'2017.03.21 - 2017.03.25', 'Art Central HK 2017', 'Mar 21 - Mar 25, 2017', 'Central Harborfront, HONG KONG', 'https://static.wixstatic.com/media/520ee6_12edef170ff543258670537b50b7154a~mv2_d_5616_3744_s_4_2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_12edef170ff543258670537b50b7154a~mv2_d_5616_3744_s_4_2.jpg', 
'GALLERY BK', 'Booth Number : E-13', 'Participating Artists :', 'BYEN Ung Pil<br>BAHK Seon Ghi<br>YOON Jong Seok', 
'https://static.wixstatic.com/media/520ee6_d695f1d4a2ec4f02ac8c03b2f5aee026~mv2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_d695f1d4a2ec4f02ac8c03b2f5aee026~mv2.jpg', 
'', 
'');

insert into artFairsMain values ('https://static.wixstatic.com/media/520ee6_f5ee52dd6f6341eab7dbe3b467570a1b~mv2.jpg/v1/crop/x_37,y_0,w_377,h_360/fill/w_220,h_208,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/marc-straus-ART-CENTRAL-HONG-KONG-2019_j.jpg', 
'2019.03.27 - 2019.03.31', 'Art Central HK 2019', 'Mar 27 - Mar 31, 2019', 'Central Harborfront, HONG KONG', 'https://static.wixstatic.com/media/520ee6_568a91b1609b4fb38cf3822366219816~mv2_d_5616_3744_s_4_2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_568a91b1609b4fb38cf3822366219816~mv2_d_5616_3744_s_4_2.jpg', 
'GALLERY BK', 'Booth Number : D-19', 'Participating Artists :', 'KANG Hyung Koo<br>BAHK Seon Ghi<br>WOO Kuk Won', 
'https://static.wixstatic.com/media/520ee6_63943f2ac92c4ea9b2b1a0edb34db2b5~mv2_d_5196_3744_s_4_2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_63943f2ac92c4ea9b2b1a0edb34db2b5~mv2_d_5196_3744_s_4_2.jpg', 
'https://static.wixstatic.com/media/520ee6_3f1be7e25aa046ef8850c5771da29028~mv2_d_5472_3624_s_4_2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_3f1be7e25aa046ef8850c5771da29028~mv2_d_5472_3624_s_4_2.jpg', 
'https://static.wixstatic.com/media/520ee6_cfb3bc1e39d3492a85abce5835674111~mv2_d_5508_3672_s_4_2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_cfb3bc1e39d3492a85abce5835674111~mv2_d_5508_3672_s_4_2.jpg');

insert into artFairsMain values ('https://static.wixstatic.com/media/520ee6_a7be8fe9610a488c99b8cb20b9e33e35~mv2_d_2726_3383_s_4_2.jpg/v1/crop/x_0,y_391,w_2726,h_2601/fill/w_220,h_208,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/890bb5a91c917f99ea208ec0af50aa4b_9uvj5I1.jpg', 
'2015.04.23 - 2015.04.26', 'G Seoul International Art Fair 2015', 'April 23 - April 26, 2015', 'Dream Design Play, DDP, Seoul, Korea', 'https://static.wixstatic.com/media/520ee6_6451fa9ace774d2ea94d248e05bc8b49~mv2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_6451fa9ace774d2ea94d248e05bc8b49~mv2.jpg', 
'GALLERY BK', 'Booth Number : B-11', 'Participating Artists :', 'BAHK Seon Ghi<br>SOHN Jin Ah<br>LEE Sang Yong<br>LEE Hun Chung<br>CHO Hae Young<br>RHA Yoo Seul', 
'https://static.wixstatic.com/media/520ee6_85accbfe594c48e5ab79b5970adcd4d4~mv2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_85accbfe594c48e5ab79b5970adcd4d4~mv2.jpg', 
'https://static.wixstatic.com/media/520ee6_9acf9a18170b481c96c0c27db815e40f~mv2.jpg/v1/fill/w_686,h_420,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/520ee6_9acf9a18170b481c96c0c27db815e40f~mv2.jpg', 
'');

drop table artFairsMain purge;

commit;
--------------------------------------------