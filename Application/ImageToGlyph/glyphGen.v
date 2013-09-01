`timescale 1ns / 1ps
//GENERATED AUTOMATICALLY BY im2glyph
//CS3710 FALL 2012, University of Utah 
//Ariosto Ferro, Jeff Thacker, Todd Cronin, Zach Wilcox 


//RETROACTIVE DESIGN



module glyphGen(
    input [15:0] glyphNUM,
    input [3:0] ROW,
    output reg [11:0] glyphRED,
    output reg [11:0] glyphGREEN,
    output reg [11:0] glyphBLUE
    );


    parameter   BLANK = 0;
    parameter	BANANA	 =	314;
    parameter	CGHOST_DOWN_0	 =	1;
    parameter	CGHOST_DOWN_1	 =	2;
    parameter	CGHOST_DOWN_2	 =	3;
    parameter	CGHOST_DOWN_3	 =	4;
    parameter	CGHOST_DOWN_4	 =	5;
    parameter	CGHOST_DOWN_5	 =	6;
    parameter	CGHOST_DOWN_6	 =	7;
    parameter	CGHOST_LEFT_0	 =	8;
    parameter	CGHOST_LEFT_1	 =	9;
    parameter	CGHOST_LEFT_2	 =	10;
    parameter	CGHOST_LEFT_3	 =	11;
    parameter	CGHOST_LEFT_4	 =	12;
    parameter	CGHOST_LEFT_5	 =	13;
    parameter	CGHOST_LEFT_6	 =	14;
    parameter	CGHOST_RIGHT_0	 =	15;
    parameter	CGHOST_RIGHT_1	 =	16;
    parameter	CGHOST_RIGHT_2	 =	17;
    parameter	CGHOST_RIGHT_3	 =	18;
    parameter	CGHOST_RIGHT_4	 =	19;
    parameter	CGHOST_RIGHT_5	 =	20;
    parameter	CGHOST_RIGHT_6	 =	21;
    parameter	CGHOST_UP_0	 =	22;
    parameter	CGHOST_UP_1	 =	23;
    parameter	CGHOST_UP_2	 =	24;
    parameter	CGHOST_UP_3	 =	25;
    parameter	CGHOST_UP_4	 =	26;
    parameter	CGHOST_UP_5	 =	27;
    parameter	CGHOST_UP_6	 =	28;
    parameter	CHERRY	 =	29;
    parameter	E1GHOST_DOWN_0	 =	30;
    parameter	E1GHOST_DOWN_1	 =	31;
    parameter	E1GHOST_DOWN_2	 =	32;
    parameter	E1GHOST_DOWN_3	 =	33;
    parameter	E1GHOST_DOWN_4	 =	34;
    parameter	E1GHOST_DOWN_5	 =	35;
    parameter	E1GHOST_DOWN_6	 =	36;
    parameter	E1GHOST_LEFT_0	 =	37;
    parameter	E1GHOST_LEFT_1	 =	38;
    parameter	E1GHOST_LEFT_2	 =	39;
    parameter	E1GHOST_LEFT_3	 =	40;
    parameter	E1GHOST_LEFT_4	 =	41;
    parameter	E1GHOST_LEFT_5	 =	42;
    parameter	E1GHOST_LEFT_6	 =	43;
    parameter	E1GHOST_RIGHT_0	 =	44;
    parameter	E1GHOST_RIGHT_1	 =	45;
    parameter	E1GHOST_RIGHT_2	 =	46;
    parameter	E1GHOST_RIGHT_3	 =	47;
    parameter	E1GHOST_RIGHT_4	 =	48;
    parameter	E1GHOST_RIGHT_5	 =	49;
    parameter	E1GHOST_RIGHT_6	 =	50;
    parameter	E1GHOST_UP_0	 =	51;
    parameter	E1GHOST_UP_1	 =	52;
    parameter	E1GHOST_UP_2	 =	53;
    parameter	E1GHOST_UP_3	 =	54;
    parameter	E1GHOST_UP_4	 =	55;
    parameter	E1GHOST_UP_5	 =	56;
    parameter	E1GHOST_UP_6	 =	57;
    parameter	E2GHOST_DOWN_0	 =	58;
    parameter	E2GHOST_DOWN_1	 =	59;
    parameter	E2GHOST_DOWN_2	 =	60;
    parameter	E2GHOST_DOWN_3	 =	61;
    parameter	E2GHOST_DOWN_4	 =	62;
    parameter	E2GHOST_DOWN_5	 =	63;
    parameter	E2GHOST_DOWN_6	 =	64;
    parameter	E2GHOST_LEFT_0	 =	65;
    parameter	E2GHOST_LEFT_1	 =	66;
    parameter	E2GHOST_LEFT_2	 =	67;
    parameter	E2GHOST_LEFT_3	 =	68;
    parameter	E2GHOST_LEFT_4	 =	69;
    parameter	E2GHOST_LEFT_5	 =	70;
    parameter	E2GHOST_LEFT_6	 =	71;
    parameter	E2GHOST_RIGHT_0	 =	72;
    parameter	E2GHOST_RIGHT_1	 =	73;
    parameter	E2GHOST_RIGHT_2	 =	74;
    parameter	E2GHOST_RIGHT_3	 =	75;
    parameter	E2GHOST_RIGHT_4	 =	76;
    parameter	E2GHOST_RIGHT_5	 =	77;
    parameter	E2GHOST_RIGHT_6	 =	78;
    parameter	E2GHOST_UP_0	 =	79;
    parameter	E2GHOST_UP_1	 =	80;
    parameter	E2GHOST_UP_2	 =	81;
    parameter	E2GHOST_UP_3	 =	82;
    parameter	E2GHOST_UP_4	 =	83;
    parameter	E2GHOST_UP_5	 =	84;
    parameter	E2GHOST_UP_6	 =	85;
    parameter	GGHOST_DOWN_0	 =	86;
    parameter	GGHOST_DOWN_1	 =	87;
    parameter	GGHOST_DOWN_2	 =	88;
    parameter	GGHOST_DOWN_3	 =	89;
    parameter	GGHOST_DOWN_4	 =	90;
    parameter	GGHOST_DOWN_5	 =	91;
    parameter	GGHOST_DOWN_6	 =	92;
    parameter	GGHOST_LEFT_0	 =	93;
    parameter	GGHOST_LEFT_1	 =	94;
    parameter	GGHOST_LEFT_2	 =	95;
    parameter	GGHOST_LEFT_3	 =	96;
    parameter	GGHOST_LEFT_4	 =	97;
    parameter	GGHOST_LEFT_5	 =	98;
    parameter	GGHOST_LEFT_6	 =	99;
    parameter	GGHOST_RIGHT_0	 =	100;
    parameter	GGHOST_RIGHT_1	 =	101;
    parameter	GGHOST_RIGHT_2	 =	102;
    parameter	GGHOST_RIGHT_3	 =	103;
    parameter	GGHOST_RIGHT_4	 =	104;
    parameter	GGHOST_RIGHT_5	 =	105;
    parameter	GGHOST_RIGHT_6	 =	106;
    parameter	GGHOST_UP_0	 =	107;
    parameter	GGHOST_UP_1	 =	108;
    parameter	GGHOST_UP_2	 =	109;
    parameter	GGHOST_UP_3	 =	110;
    parameter	GGHOST_UP_4	 =	111;
    parameter	GGHOST_UP_5	 =	112;
    parameter	GGHOST_UP_6	 =	113;
    parameter	LETTER_A	 =	114;
    parameter	LETTER_B	 =	115;
    parameter	LETTER_C	 =	116;
    parameter	LETTER_D	 =	117;
    parameter	LETTER_E	 =	118;
    parameter	LETTER_EXCLAMATION	 =	140;
    parameter	LETTER_F	 =	119;
    parameter	LETTER_G	 =	120;
    parameter	LETTER_H	 =	121;
    parameter	LETTER_I	 =	122;
    parameter	LETTER_J	 =	123;
    parameter	LETTER_K	 =	124;
    parameter	LETTER_L	 =	125;
    parameter	LETTER_M	 =	126;
    parameter	LETTER_N	 =	127;
    parameter	LETTER_O	 =	128;
    parameter	LETTER_P	 =	129;
    parameter	LETTER_Q	 =	130;
    parameter	LETTER_R	 =	131;
    parameter	LETTER_S	 =	132;
    parameter	LETTER_T	 =	133;
    parameter	LETTER_U	 =	134;
    parameter	LETTER_V	 =	135;
    parameter	LETTER_W	 =	136;
    parameter	LETTER_X	 =	137;
    parameter	LETTER_Y	 =	138;
    parameter	LETTER_Z	 =	139;
    parameter	MGHOST_DOWN_0	 =	141;
    parameter	MGHOST_DOWN_1	 =	142;
    parameter	MGHOST_DOWN_2	 =	143;
    parameter	MGHOST_DOWN_3	 =	144;
    parameter	MGHOST_DOWN_4	 =	145;
    parameter	MGHOST_DOWN_5	 =	146;
    parameter	MGHOST_DOWN_6	 =	147;
    parameter	MGHOST_LEFT_0	 =	148;
    parameter	MGHOST_LEFT_1	 =	149;
    parameter	MGHOST_LEFT_2	 =	150;
    parameter	MGHOST_LEFT_3	 =	151;
    parameter	MGHOST_LEFT_4	 =	152;
    parameter	MGHOST_LEFT_5	 =	153;
    parameter	MGHOST_LEFT_6	 =	154;
    parameter	MGHOST_RIGHT_0	 =	155;
    parameter	MGHOST_RIGHT_1	 =	156;
    parameter	MGHOST_RIGHT_2	 =	157;
    parameter	MGHOST_RIGHT_3	 =	158;
    parameter	MGHOST_RIGHT_4	 =	159;
    parameter	MGHOST_RIGHT_5	 =	160;
    parameter	MGHOST_RIGHT_6	 =	161;
    parameter	MGHOST_UP_0	 =	162;
    parameter	MGHOST_UP_1	 =	163;
    parameter	MGHOST_UP_2	 =	164;
    parameter	MGHOST_UP_3	 =	165;
    parameter	MGHOST_UP_4	 =	166;
    parameter	MGHOST_UP_5	 =	167;
    parameter	MGHOST_UP_6	 =	168;
    parameter	NUMBER_0	 =	169;
    parameter	NUMBER_1	 =	170;
    parameter	NUMBER_2	 =	171;
    parameter	NUMBER_3	 =	172;
    parameter	NUMBER_4	 =	173;
    parameter	NUMBER_5	 =	174;
    parameter	NUMBER_6	 =	175;
    parameter	NUMBER_7	 =	176;
    parameter	NUMBER_8	 =	177;
    parameter	NUMBER_9	 =	178;
    parameter	PMANCLOSED_DOWN_0	 =	179;
    parameter	PMANCLOSED_DOWN_1	 =	180;
    parameter	PMANCLOSED_DOWN_2	 =	181;
    parameter	PMANCLOSED_DOWN_3	 =	182;
    parameter	PMANCLOSED_DOWN_4	 =	183;
    parameter	PMANCLOSED_DOWN_5	 =	184;
    parameter	PMANCLOSED_DOWN_6	 =	185;
    parameter	PMANCLOSED_LEFT_0	 =	186;
    parameter	PMANCLOSED_LEFT_1	 =	187;
    parameter	PMANCLOSED_LEFT_2	 =	188;
    parameter	PMANCLOSED_LEFT_3	 =	189;
    parameter	PMANCLOSED_LEFT_4	 =	190;
    parameter	PMANCLOSED_LEFT_5	 =	191;
    parameter	PMANCLOSED_LEFT_6	 =	192;
    parameter	PMANCLOSED_PILL_DOWN1	 =	193;
    parameter	PMANCLOSED_PILL_DOWN2	 =	194;
    parameter	PMANCLOSED_PILL_DOWN3	 =	195;
    parameter	PMANCLOSED_PILL_LEFT1	 =	196;
    parameter	PMANCLOSED_PILL_LEFT2	 =	197;
    parameter	PMANCLOSED_PILL_LEFT3	 =	198;
    parameter	PMANCLOSED_PILL_RIGHT1	 =	199;
    parameter	PMANCLOSED_PILL_RIGHT2	 =	200;
    parameter	PMANCLOSED_PILL_RIGHT3	 =	201;
    parameter	PMANCLOSED_PILL_UP1	 =	202;
    parameter	PMANCLOSED_PILL_UP2	 =	203;
    parameter	PMANCLOSED_PILL_UP3	 =	204;
    parameter	PMANCLOSED_RIGHT_0	 =	205;
    parameter	PMANCLOSED_RIGHT_1	 =	206;
    parameter	PMANCLOSED_RIGHT_2	 =	207;
    parameter	PMANCLOSED_RIGHT_3	 =	208;
    parameter	PMANCLOSED_RIGHT_4	 =	209;
    parameter	PMANCLOSED_RIGHT_5	 =	210;
    parameter	PMANCLOSED_RIGHT_6	 =	211;
    parameter	PMANCLOSED_UP_0	 =	212;
    parameter	PMANCLOSED_UP_1	 =	213;
    parameter	PMANCLOSED_UP_2	 =	214;
    parameter	PMANCLOSED_UP_3	 =	215;
    parameter	PMANCLOSED_UP_4	 =	216;
    parameter	PMANCLOSED_UP_5	 =	217;
    parameter	PMANCLOSED_UP_6	 =	218;
    parameter	PMANOPEN_DOWN_0	 =	219;
    parameter	PMANOPEN_DOWN_1	 =	220;
    parameter	PMANOPEN_DOWN_2	 =	221;
    parameter	PMANOPEN_DOWN_3	 =	222;
    parameter	PMANOPEN_DOWN_4	 =	223;
    parameter	PMANOPEN_DOWN_5	 =	224;
    parameter	PMANOPEN_DOWN_6	 =	225;
    parameter	PMANOPEN_LEFT_0	 =	226;
    parameter	PMANOPEN_LEFT_1	 =	227;
    parameter	PMANOPEN_LEFT_2	 =	228;
    parameter	PMANOPEN_LEFT_3	 =	229;
    parameter	PMANOPEN_LEFT_4	 =	230;
    parameter	PMANOPEN_LEFT_5	 =	231;
    parameter	PMANOPEN_LEFT_6	 =	232;
    parameter	PMANOPEN_PILL_DOWN1	 =	233;
    parameter	PMANOPEN_PILL_DOWN2	 =	234;
    parameter	PMANOPEN_PILL_DOWN3	 =	235;
    parameter	PMANOPEN_PILL_LEFT1	 =	236;
    parameter	PMANOPEN_PILL_LEFT2	 =	237;
    parameter	PMANOPEN_PILL_LEFT3	 =	238;
    parameter	PMANOPEN_PILL_RIGHT1	 =	239;
    parameter	PMANOPEN_PILL_RIGHT2	 =	240;
    parameter	PMANOPEN_PILL_RIGHT3	 =	241;
    parameter	PMANOPEN_PILL_UP1	 =	242;
    parameter	PMANOPEN_PILL_UP2	 =	243;
    parameter	PMANOPEN_PILL_UP3	 =	244;
    parameter	PMANOPEN_RIGHT_0	 =	245;
    parameter	PMANOPEN_RIGHT_1	 =	246;
    parameter	PMANOPEN_RIGHT_2	 =	247;
    parameter	PMANOPEN_RIGHT_3	 =	248;
    parameter	PMANOPEN_RIGHT_4	 =	249;
    parameter	PMANOPEN_RIGHT_5	 =	250;
    parameter	PMANOPEN_RIGHT_6	 =	251;
    parameter	PMANOPEN_SUPERPILL_DOWN1	 =	252;
    parameter	PMANOPEN_SUPERPILL_DOWN2	 =	253;
    parameter	PMANOPEN_SUPERPILL_DOWN3	 =	254;
    parameter	PMANOPEN_SUPERPILL_LEFT1	 =	255;
    parameter	PMANOPEN_SUPERPILL_LEFT2	 =	256;
    parameter	PMANOPEN_SUPERPILL_LEFT3	 =	257;
    parameter	PMANOPEN_SUPERPILL_RIGHT1	 =	258;
    parameter	PMANOPEN_SUPERPILL_RIGHT2	 =	259;
    parameter	PMANOPEN_SUPERPILL_RIGHT3	 =	260;
    parameter	PMANOPEN_SUPERPILL_UP1	 =	261;
    parameter	PMANOPEN_SUPERPILL_UP2	 =	262;
    parameter	PMANOPEN_SUPERPILL_UP3	 =	263;
    parameter	PMANOPEN_UP_0	 =	264;
    parameter	PMANOPEN_UP_1	 =	265;
    parameter	PMANOPEN_UP_2	 =	266;
    parameter	PMANOPEN_UP_3	 =	267;
    parameter	PMANOPEN_UP_4	 =	268;
    parameter	PMANOPEN_UP_5	 =	269;
    parameter	PMANOPEN_UP_6	 =	270;
    parameter	PILL	 =	271;
    parameter	RGHOST_DOWN_0	 =	272;
    parameter	RGHOST_DOWN_1	 =	273;
    parameter	RGHOST_DOWN_2	 =	274;
    parameter	RGHOST_DOWN_3	 =	275;
    parameter	RGHOST_DOWN_4	 =	276;
    parameter	RGHOST_DOWN_5	 =	277;
    parameter	RGHOST_DOWN_6	 =	278;
    parameter	RGHOST_LEFT_0	 =	279;
    parameter	RGHOST_LEFT_1	 =	280;
    parameter	RGHOST_LEFT_2	 =	281;
    parameter	RGHOST_LEFT_3	 =	282;
    parameter	RGHOST_LEFT_4	 =	283;
    parameter	RGHOST_LEFT_5	 =	284;
    parameter	RGHOST_LEFT_6	 =	285;
    parameter	RGHOST_RIGHT_0	 =	286;
    parameter	RGHOST_RIGHT_1	 =	287;
    parameter	RGHOST_RIGHT_2	 =	288;
    parameter	RGHOST_RIGHT_3	 =	289;
    parameter	RGHOST_RIGHT_4	 =	290;
    parameter	RGHOST_RIGHT_5	 =	291;
    parameter	RGHOST_RIGHT_6	 =	292;
    parameter	RGHOST_UP_0	 =	293;
    parameter	RGHOST_UP_1	 =	294;
    parameter	RGHOST_UP_2	 =	295;
    parameter	RGHOST_UP_3	 =	296;
    parameter	RGHOST_UP_4	 =	297;
    parameter	RGHOST_UP_5	 =	298;
    parameter	RGHOST_UP_6	 =	299;
    parameter	SUPERPILL	 =	300;
    parameter	WALL_CORNER1	 =	801;
    parameter	WALL_CORNER2	 =	802;
    parameter	WALL_CORNER3	 =	803;
    parameter	WALL_CORNER4	 =	804;
    parameter	WALL_INV_CORNER1	 =	805;
    parameter	WALL_INV_CORNER2	 =	806;
    parameter	WALL_INV_CORNER3	 =	807;
    parameter	WALL_INV_CORNER4	 =	808;
    parameter	WALL_SIDE1	 =	809;
    parameter	WALL_SIDE2	 =	810;
    parameter	WALL_SIDE3	 =	811;
    parameter	WALL_SIDE4	 =	812;
    parameter	WATERMELON	 =	313;
    parameter	ZCIRCLER_01	 =	315;
    parameter	ZCIRCLER_02	 =	316;
    parameter	ZCIRCLER_03	 =	317;
    parameter	ZCIRCLER_04	 =	318;
    parameter	ZCIRCLER_05	 =	319;
    parameter	ZCIRCLER_06	 =	320;
    parameter	ZCIRCLER_07	 =	321;
    parameter	ZCIRCLER_08	 =	322;
    parameter	ZCIRCLER_09	 =	323;
    parameter	ZCIRCLER_10	 =	324;
    parameter	ZCIRCLER_11	 =	325;
    parameter	ZCIRCLER_12	 =	326;
    parameter	ZCIRCLER_13	 =	327;
    parameter	ZCIRCLER_14	 =	328;
    parameter	ZCIRCLER_15	 =	329;
    parameter	ZCIRCLER_16	 =	330;
    parameter	ZCIRCLER_17	 =	331;
    parameter	ZCIRCLER_18	 =	332;
    parameter	ZCIRCLER_19	 =	333;
    parameter	ZCIRCLER_20	 =	334;
    parameter	ZCIRCLER_21	 =	335;
    parameter	ZCIRCLER_22	 =	336;
    parameter	ZCIRCLER_23	 =	337;
    parameter	ZCIRCLER_24	 =	338;
    parameter	ZCIRCLER_25	 =	339;
    parameter	ZCIRCLER_26	 =	340;
    parameter	ZCIRCLER_27	 =	341;
    parameter	ZCIRCLER_28	 =	342;
    parameter	ZCIRCLER_29	 =	343;
    parameter	ZCIRCLER_30	 =	344;
    parameter	ZCIRCLER_31	 =	345;
    parameter	ZCIRCLER_32	 =	346;
    parameter	ZCIRCLER_33	 =	347;
    parameter	ZCIRCLER_34	 =	348;
    parameter	ZCIRCLER_35	 =	349;
    parameter	ZCIRCLER_36	 =	350;
    parameter	ZCIRCLER_37	 =	351;
    parameter	ZCIRCLER_38	 =	352;
    parameter	ZCIRCLER_39	 =	353;
    parameter	ZCIRCLER_40	 =	354;
    parameter	ZCIRCLER_41	 =	355;
    parameter	ZCIRCLER_42	 =	356;
    parameter	ZCIRCLER_43	 =	357;
    parameter	ZCIRCLER_44	 =	358;
    parameter	ZCIRCLER_45	 =	359;
    parameter	ZCIRCLER_46	 =	360;
    parameter	ZCIRCLER_47	 =	361;
    parameter	ZCIRCLER_48	 =	362;
    parameter	ZCIRCLER_49	 =	363;
    parameter	ZCIRCLER_50	 =	364;
    parameter	ZCIRCLER_51	 =	365;
    parameter	ZCIRCLER_52	 =	366;
    parameter	ZCIRCLER_53	 =	367;
    parameter	ZCIRCLER_54	 =	368;
    parameter	ZCIRCLER_55	 =	369;
    parameter	ZCIRCLER_56	 =	370;
    parameter	ZCIRCLER_57	 =	371;
    parameter	ZCIRCLER_58	 =	372;
    parameter	ZCIRCLER_59	 =	373;
    parameter	ZCIRCLER_60	 =	374;
    parameter	ZCIRCLER_61	 =	375;
    parameter	ZCIRCLER_62	 =	376;
    parameter	ZCIRCLER_63	 =	377;
    parameter	ZCIRCLER_64	 =	378;
    parameter	ZDESIGN_01	 =	379;
    parameter	ZDESIGN_02	 =	380;
    parameter	ZDESIGN_03	 =	381;
    parameter	ZDESIGN_04	 =	382;
    parameter	ZDESIGN_05	 =	383;
    parameter	ZDESIGN_06	 =	384;
    parameter	ZDESIGN_07	 =	385;
    parameter	ZDESIGN_08	 =	386;
    parameter	ZDESIGN_09	 =	387;
    parameter	ZDESIGN_10	 =	388;
    parameter	ZDESIGN_11	 =	389;
    parameter	ZDESIGN_12	 =	390;
    parameter	ZDESIGN_13	 =	391;
    parameter	ZDESIGN_14	 =	392;
    parameter	ZDESIGN_15	 =	393;
    parameter	ZDESIGN_16	 =	394;
    parameter	ZDESIGN_17	 =	395;
    parameter	ZDESIGN_18	 =	396;
    parameter	ZDESIGN_19	 =	397;
    parameter	ZDESIGN_20	 =	398;
    parameter	ZDESIGN_21	 =	399;
    parameter	ZDESIGN_22	 =	400;
    parameter	ZDESIGN_23	 =	401;
    parameter	ZDESIGN_24	 =	402;
    parameter	ZRETRO_01	 =	403;
    parameter	ZRETRO_02	 =	404;
    parameter	ZRETRO_03	 =	405;
    parameter	ZRETRO_04	 =	406;
    parameter	ZRETRO_05	 =	407;
    parameter	ZRETRO_06	 =	408;
    parameter	ZRETRO_07	 =	409;
    parameter	ZRETRO_08	 =	410;
    parameter	ZRETRO_09	 =	411;
    parameter	ZRETRO_10	 =	412;
    parameter	ZRETRO_11	 =	413;
    parameter	ZRETRO_12	 =	414;
    parameter	ZRETRO_13	 =	415;
    parameter	ZRETRO_14	 =	416;
    parameter	ZRETRO_15	 =	417;
    parameter	ZRETRO_16	 =	418;
    parameter	ZRETRO_17	 =	419;
    parameter	ZRETRO_18	 =	420;
    parameter	ZRETRO_19	 =	421;
    parameter	ZRETRO_20	 =	422;
    parameter	ZRETRO_21	 =	423;
    parameter	ZRETRO_22	 =	424;
    parameter	ZRETRO_23	 =	425;
    parameter	ZRETRO_24	 =	426;
    parameter	ZRETRO_25	 =	427;
    parameter	ZRETRO_26	 =	428;
    parameter	ZRETRO_27	 =	429;
    parameter	ZRETRO_28	 =	430;
    parameter	ZRETRO_29	 =	431;
    parameter	ZRETRO_30	 =	432;
    parameter	ZRETRO_31	 =	433;
    parameter	ZRETRO_32	 =	434;
    parameter	ZRETRO_33	 =	435;
    parameter	ZRETRO_34	 =	436;
    parameter	ZRETRO_35	 =	437;
    parameter	ZRETRO_36	 =	438;
    parameter	ZRETRO_37	 =	439;
    parameter	ZRETRO_38	 =	440;
    parameter	ZRETRO_39	 =	441;
    parameter	ZRETRO_40	 =	442;
    parameter	ZRETRO_41	 =	443;
    parameter	ZRETRO_42	 =	444;
    parameter	ZRETRO_43	 =	445;
    parameter	ZRETRO_44	 =	446;
    parameter	ZRETRO_45	 =	447;


    always@(*) begin
    	glyphRED = 0;
    	glyphBLUE = 0;
    	glyphRED = 0;
    	case(glyphNUM)
    		BLANK:
                begin
                    glyphBLUE	 = 0;
                    glyphRED	 = 0;
                    glyphGREEN	 = 0;
                end
    		BANANA:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111111100;
    						glyphBLUE	 = 12'b000000100000;
    						glyphGREEN	 = 12'b000111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111110;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b001111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111101110111;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b111101110111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110011110011;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b110011110011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000010110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b000010110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000010000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_DOWN_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_DOWN_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_DOWN_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_DOWN_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_DOWN_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_DOWN_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_DOWN_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_LEFT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000010001000;
    						glyphBLUE	 = 12'b011011101110;
    						glyphGREEN	 = 12'b011011101110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_LEFT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000110011;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000010001;
    						glyphBLUE	 = 12'b000011011101;
    						glyphGREEN	 = 12'b000011011101;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011001100;
    						glyphGREEN	 = 12'b000011001100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_LEFT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_LEFT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000110;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000010;
    						glyphBLUE	 = 12'b000000011011;
    						glyphGREEN	 = 12'b000000011011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011001;
    						glyphGREEN	 = 12'b000000011001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_LEFT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001000000000;
    						glyphBLUE	 = 12'b101110000000;
    						glyphGREEN	 = 12'b101110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100110000000;
    						glyphGREEN	 = 12'b100110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_LEFT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_LEFT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110011000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b010001000000;
    						glyphBLUE	 = 12'b011101110000;
    						glyphGREEN	 = 12'b011101110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_RIGHT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000100010000;
    						glyphBLUE	 = 12'b011101110110;
    						glyphGREEN	 = 12'b011101110110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_RIGHT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000110011;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000100010;
    						glyphBLUE	 = 12'b000011101110;
    						glyphGREEN	 = 12'b000011101110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011001100;
    						glyphGREEN	 = 12'b000011001100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_RIGHT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_RIGHT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000110;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000100;
    						glyphBLUE	 = 12'b000000011101;
    						glyphGREEN	 = 12'b000000011101;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011001;
    						glyphGREEN	 = 12'b000000011001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_RIGHT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b010000000000;
    						glyphBLUE	 = 12'b110110000000;
    						glyphGREEN	 = 12'b110110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100110000000;
    						glyphGREEN	 = 12'b100110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_RIGHT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_RIGHT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110011000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100010000000;
    						glyphBLUE	 = 12'b101110110000;
    						glyphGREEN	 = 12'b101110110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_UP_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_UP_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_UP_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_UP_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_UP_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_UP_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CGHOST_UP_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		CHERRY:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001010000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001001000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000010000100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111101110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000001110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_DOWN_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_DOWN_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_DOWN_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_DOWN_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_DOWN_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_DOWN_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_DOWN_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_LEFT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011011101110;
    						glyphGREEN	 = 12'b011011101110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_LEFT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001001100;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001001100;
    						glyphBLUE	 = 12'b000011011101;
    						glyphGREEN	 = 12'b000011011101;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001001100;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011001100;
    						glyphGREEN	 = 12'b000011001100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_LEFT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_LEFT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000001001;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000001001;
    						glyphBLUE	 = 12'b000000011011;
    						glyphGREEN	 = 12'b000000011011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000001001;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011001;
    						glyphGREEN	 = 12'b000000011001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_LEFT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100100000000;
    						glyphBLUE	 = 12'b101110000000;
    						glyphGREEN	 = 12'b101110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100110000000;
    						glyphGREEN	 = 12'b100110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_LEFT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_LEFT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001100100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001100100000;
    						glyphBLUE	 = 12'b011101110000;
    						glyphGREEN	 = 12'b011101110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001100100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_RIGHT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011101110110;
    						glyphGREEN	 = 12'b011101110110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_RIGHT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001001100;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001001100;
    						glyphBLUE	 = 12'b000011101110;
    						glyphGREEN	 = 12'b000011101110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001001100;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011001100;
    						glyphGREEN	 = 12'b000011001100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_RIGHT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_RIGHT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000001001;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000001001;
    						glyphBLUE	 = 12'b000000011101;
    						glyphGREEN	 = 12'b000000011101;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000001001;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011001;
    						glyphGREEN	 = 12'b000000011001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_RIGHT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100100000000;
    						glyphBLUE	 = 12'b110110000000;
    						glyphGREEN	 = 12'b110110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100100000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100110000000;
    						glyphGREEN	 = 12'b100110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_RIGHT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_RIGHT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001100100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001100100000;
    						glyphBLUE	 = 12'b101110110000;
    						glyphGREEN	 = 12'b101110110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001100100000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_UP_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_UP_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_UP_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_UP_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_UP_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_UP_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E1GHOST_UP_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001001100100;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_DOWN_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001100001100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b010100001010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_DOWN_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001100001100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b010100001010;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_DOWN_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_DOWN_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001100001100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b010100001010;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_DOWN_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_DOWN_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001100001100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_DOWN_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b010100001010;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_LEFT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001100001100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000010001000;
    						glyphBLUE	 = 12'b011011101110;
    						glyphGREEN	 = 12'b010010001010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_LEFT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001100001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000110011;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010110011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000010001;
    						glyphBLUE	 = 12'b000011011101;
    						glyphGREEN	 = 12'b000010010001;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010110011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011001100;
    						glyphGREEN	 = 12'b000011001100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_LEFT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_LEFT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000110;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000010;
    						glyphBLUE	 = 12'b000000011011;
    						glyphGREEN	 = 12'b000000010010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011001;
    						glyphGREEN	 = 12'b000000011001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_LEFT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b001100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b011010000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001000000000;
    						glyphBLUE	 = 12'b101110000000;
    						glyphGREEN	 = 12'b001010000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b011010000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100110000000;
    						glyphGREEN	 = 12'b100110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_LEFT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_LEFT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b100001100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110011000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b110011010000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b010001000000;
    						glyphBLUE	 = 12'b011101110000;
    						glyphGREEN	 = 12'b010001010000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b110011010000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_RIGHT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001100001100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000100010000;
    						glyphBLUE	 = 12'b011101110110;
    						glyphGREEN	 = 12'b010100010010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_RIGHT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001100001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000110011;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010110011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000100010;
    						glyphBLUE	 = 12'b000011101110;
    						glyphGREEN	 = 12'b000010100010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000010110011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011001100;
    						glyphGREEN	 = 12'b000011001100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_RIGHT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_RIGHT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000110;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000100;
    						glyphBLUE	 = 12'b000000011101;
    						glyphGREEN	 = 12'b000000010100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000010110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011001;
    						glyphGREEN	 = 12'b000000011001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_RIGHT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b001100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b011010000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b010000000000;
    						glyphBLUE	 = 12'b110110000000;
    						glyphGREEN	 = 12'b010010000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000010000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b011010000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b100110000000;
    						glyphGREEN	 = 12'b100110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_RIGHT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_RIGHT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b100001100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110011000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b110011010000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100010000000;
    						glyphBLUE	 = 12'b101110110000;
    						glyphGREEN	 = 12'b100010010000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000010000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b110011010000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_UP_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001100001100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b010100001010;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_UP_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001100001100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b010100001010;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_UP_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_UP_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001100001100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b010100001010;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_UP_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_UP_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001100001100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		E2GHOST_UP_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b010100001010;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010000000010;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b010110011010;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_DOWN_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_DOWN_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_DOWN_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_DOWN_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_DOWN_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_DOWN_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_DOWN_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_LEFT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000010001000;
    						glyphBLUE	 = 12'b000010001000;
    						glyphGREEN	 = 12'b011011101110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_LEFT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000110011;
    						glyphBLUE	 = 12'b000000110011;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000010001;
    						glyphBLUE	 = 12'b000000010001;
    						glyphGREEN	 = 12'b000011011101;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011001100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_LEFT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_LEFT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000110;
    						glyphBLUE	 = 12'b000000000110;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000010;
    						glyphBLUE	 = 12'b000000000010;
    						glyphGREEN	 = 12'b000000011011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_LEFT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001000000000;
    						glyphBLUE	 = 12'b001000000000;
    						glyphGREEN	 = 12'b101110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_LEFT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_LEFT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110011000000;
    						glyphBLUE	 = 12'b110011000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b010001000000;
    						glyphBLUE	 = 12'b010001000000;
    						glyphGREEN	 = 12'b011101110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_RIGHT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000100010000;
    						glyphBLUE	 = 12'b000100010000;
    						glyphGREEN	 = 12'b011101110110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_RIGHT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000110011;
    						glyphBLUE	 = 12'b000000110011;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000100010;
    						glyphBLUE	 = 12'b000000100010;
    						glyphGREEN	 = 12'b000011101110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011001100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_RIGHT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_RIGHT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000110;
    						glyphBLUE	 = 12'b000000000110;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000100;
    						glyphBLUE	 = 12'b000000000100;
    						glyphGREEN	 = 12'b000000011101;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_RIGHT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b010000000000;
    						glyphBLUE	 = 12'b010000000000;
    						glyphGREEN	 = 12'b110110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_RIGHT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_RIGHT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110011000000;
    						glyphBLUE	 = 12'b110011000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100010000000;
    						glyphBLUE	 = 12'b100010000000;
    						glyphGREEN	 = 12'b101110110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_UP_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_UP_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_UP_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_UP_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_UP_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_UP_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		GGHOST_UP_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000100001000;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b011101101110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_A:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111100;
    						glyphBLUE	 = 12'b011111111100;
    						glyphGREEN	 = 12'b011111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111100;
    						glyphBLUE	 = 12'b011111111100;
    						glyphGREEN	 = 12'b011111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_B:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111000000;
    						glyphBLUE	 = 12'b011111000000;
    						glyphGREEN	 = 12'b011111000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011001100000;
    						glyphBLUE	 = 12'b011001100000;
    						glyphGREEN	 = 12'b011001100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011001100000;
    						glyphBLUE	 = 12'b011001100000;
    						glyphGREEN	 = 12'b011001100000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011001100000;
    						glyphBLUE	 = 12'b011001100000;
    						glyphGREEN	 = 12'b011001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111000000;
    						glyphBLUE	 = 12'b011111000000;
    						glyphGREEN	 = 12'b011111000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111000000;
    						glyphBLUE	 = 12'b011111000000;
    						glyphGREEN	 = 12'b011111000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011001100000;
    						glyphBLUE	 = 12'b011001100000;
    						glyphGREEN	 = 12'b011001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011001100000;
    						glyphBLUE	 = 12'b011001100000;
    						glyphGREEN	 = 12'b011001100000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b011111100000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111000000;
    						glyphBLUE	 = 12'b011111000000;
    						glyphGREEN	 = 12'b011111000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_C:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111100;
    						glyphBLUE	 = 12'b011111111100;
    						glyphGREEN	 = 12'b011111111100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011000001100;
    						glyphBLUE	 = 12'b011000001100;
    						glyphGREEN	 = 12'b011000001100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011000001100;
    						glyphBLUE	 = 12'b011000001100;
    						glyphGREEN	 = 12'b011000001100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011000001100;
    						glyphBLUE	 = 12'b011000001100;
    						glyphGREEN	 = 12'b011000001100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_D:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b011111100000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011100111100;
    						glyphBLUE	 = 12'b011100111100;
    						glyphGREEN	 = 12'b011100111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100111100;
    						glyphBLUE	 = 12'b011100111100;
    						glyphGREEN	 = 12'b011100111100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b011111100000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_E:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_EXCLAMATION:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_F:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001100000000;
    						glyphBLUE	 = 12'b001100000000;
    						glyphGREEN	 = 12'b001100000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_G:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111100000;
    						glyphBLUE	 = 12'b001111100000;
    						glyphGREEN	 = 12'b001111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011000111000;
    						glyphBLUE	 = 12'b011000111000;
    						glyphGREEN	 = 12'b011000111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011000111000;
    						glyphBLUE	 = 12'b011000111000;
    						glyphGREEN	 = 12'b011000111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011001111000;
    						glyphBLUE	 = 12'b011001111000;
    						glyphGREEN	 = 12'b011001111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011000111100;
    						glyphBLUE	 = 12'b011000111100;
    						glyphGREEN	 = 12'b011000111100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011000011100;
    						glyphBLUE	 = 12'b011000011100;
    						glyphGREEN	 = 12'b011000011100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111100;
    						glyphBLUE	 = 12'b011111111100;
    						glyphGREEN	 = 12'b011111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_H:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001100000110;
    						glyphBLUE	 = 12'b001100000110;
    						glyphGREEN	 = 12'b001100000110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111011111;
    						glyphBLUE	 = 12'b011111011111;
    						glyphGREEN	 = 12'b011111011111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b011111111111;
    						glyphGREEN	 = 12'b011111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b011111111111;
    						glyphGREEN	 = 12'b011111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b011111111111;
    						glyphGREEN	 = 12'b011111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111011111;
    						glyphBLUE	 = 12'b011111011111;
    						glyphGREEN	 = 12'b011111011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001100000110;
    						glyphBLUE	 = 12'b001100000110;
    						glyphGREEN	 = 12'b001100000110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_I:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111100000;
    						glyphBLUE	 = 12'b001111100000;
    						glyphGREEN	 = 12'b001111100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111100000;
    						glyphBLUE	 = 12'b001111100000;
    						glyphGREEN	 = 12'b001111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_J:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000001100;
    						glyphBLUE	 = 12'b000000001100;
    						glyphGREEN	 = 12'b000000001100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000110011100;
    						glyphBLUE	 = 12'b000110011100;
    						glyphGREEN	 = 12'b000110011100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001110011100;
    						glyphBLUE	 = 12'b001110011100;
    						glyphGREEN	 = 12'b001110011100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111100;
    						glyphBLUE	 = 12'b011111111100;
    						glyphGREEN	 = 12'b011111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_K:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001100000110;
    						glyphBLUE	 = 12'b001100000110;
    						glyphGREEN	 = 12'b001100000110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011110001110;
    						glyphBLUE	 = 12'b011110001110;
    						glyphGREEN	 = 12'b011110001110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011110011100;
    						glyphBLUE	 = 12'b011110011100;
    						glyphGREEN	 = 12'b011110011100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011110111000;
    						glyphBLUE	 = 12'b011110111000;
    						glyphGREEN	 = 12'b011110111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011110110000;
    						glyphBLUE	 = 12'b011110110000;
    						glyphGREEN	 = 12'b011110110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b011111100000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011110111000;
    						glyphBLUE	 = 12'b011110111000;
    						glyphGREEN	 = 12'b011110111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011110011100;
    						glyphBLUE	 = 12'b011110011100;
    						glyphGREEN	 = 12'b011110011100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011110001110;
    						glyphBLUE	 = 12'b011110001110;
    						glyphGREEN	 = 12'b011110001110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001100000110;
    						glyphBLUE	 = 12'b001100000110;
    						glyphGREEN	 = 12'b001100000110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_L:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001100000000;
    						glyphBLUE	 = 12'b001100000000;
    						glyphGREEN	 = 12'b001100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_M:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001100001000;
    						glyphBLUE	 = 12'b001100001000;
    						glyphGREEN	 = 12'b001100001000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011110011100;
    						glyphBLUE	 = 12'b011110011100;
    						glyphGREEN	 = 12'b011110011100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111100;
    						glyphBLUE	 = 12'b011111111100;
    						glyphGREEN	 = 12'b011111111100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011101101100;
    						glyphBLUE	 = 12'b011101101100;
    						glyphGREEN	 = 12'b011101101100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011101101100;
    						glyphBLUE	 = 12'b011101101100;
    						glyphGREEN	 = 12'b011101101100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011101101100;
    						glyphBLUE	 = 12'b011101101100;
    						glyphGREEN	 = 12'b011101101100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011101001100;
    						glyphBLUE	 = 12'b011101001100;
    						glyphGREEN	 = 12'b011101001100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100001100;
    						glyphBLUE	 = 12'b011100001100;
    						glyphGREEN	 = 12'b011100001100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100001100;
    						glyphBLUE	 = 12'b011100001100;
    						glyphGREEN	 = 12'b011100001100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011100001100;
    						glyphBLUE	 = 12'b011100001100;
    						glyphGREEN	 = 12'b011100001100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b001000000100;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_N:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001100010000;
    						glyphBLUE	 = 12'b001100010000;
    						glyphGREEN	 = 12'b001100010000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011110011000;
    						glyphBLUE	 = 12'b011110011000;
    						glyphGREEN	 = 12'b011110011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011110011000;
    						glyphBLUE	 = 12'b011110011000;
    						glyphGREEN	 = 12'b011110011000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111011000;
    						glyphBLUE	 = 12'b011111011000;
    						glyphGREEN	 = 12'b011111011000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011101111000;
    						glyphBLUE	 = 12'b011101111000;
    						glyphGREEN	 = 12'b011101111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011101111000;
    						glyphBLUE	 = 12'b011101111000;
    						glyphGREEN	 = 12'b011101111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001100011000;
    						glyphBLUE	 = 12'b001100011000;
    						glyphGREEN	 = 12'b001100011000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_O:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011110111100;
    						glyphBLUE	 = 12'b011110111100;
    						glyphGREEN	 = 12'b011110111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001110111000;
    						glyphBLUE	 = 12'b001110111000;
    						glyphGREEN	 = 12'b001110111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_P:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011100001100;
    						glyphBLUE	 = 12'b011100001100;
    						glyphGREEN	 = 12'b011100001100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011100001100;
    						glyphBLUE	 = 12'b011100001100;
    						glyphGREEN	 = 12'b011100001100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011000000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_Q:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111000000;
    						glyphBLUE	 = 12'b001111000000;
    						glyphGREEN	 = 12'b001111000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b011111100000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011001100000;
    						glyphBLUE	 = 12'b011001100000;
    						glyphGREEN	 = 12'b011001100000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011001100000;
    						glyphBLUE	 = 12'b011001100000;
    						glyphGREEN	 = 12'b011001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011001100000;
    						glyphBLUE	 = 12'b011001100000;
    						glyphGREEN	 = 12'b011001100000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011001100000;
    						glyphBLUE	 = 12'b011001100000;
    						glyphGREEN	 = 12'b011001100000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011001100000;
    						glyphBLUE	 = 12'b011001100000;
    						glyphGREEN	 = 12'b011001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011001100000;
    						glyphBLUE	 = 12'b011001100000;
    						glyphGREEN	 = 12'b011001100000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111000000;
    						glyphBLUE	 = 12'b001111000000;
    						glyphGREEN	 = 12'b001111000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000001110000;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_R:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111100;
    						glyphBLUE	 = 12'b011111111100;
    						glyphGREEN	 = 12'b011111111100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011100001100;
    						glyphBLUE	 = 12'b011100001100;
    						glyphGREEN	 = 12'b011100001100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100111000;
    						glyphBLUE	 = 12'b011100111000;
    						glyphGREEN	 = 12'b011100111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001000001000;
    						glyphBLUE	 = 12'b001000001000;
    						glyphGREEN	 = 12'b001000001000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_S:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011111000;
    						glyphBLUE	 = 12'b000011111000;
    						glyphGREEN	 = 12'b000011111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111111100;
    						glyphBLUE	 = 12'b000111111100;
    						glyphGREEN	 = 12'b000111111100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000110011100;
    						glyphBLUE	 = 12'b000110011100;
    						glyphGREEN	 = 12'b000110011100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000110001000;
    						glyphBLUE	 = 12'b000110001000;
    						glyphGREEN	 = 12'b000110001000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001110000;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001000111000;
    						glyphBLUE	 = 12'b001000111000;
    						glyphGREEN	 = 12'b001000111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001100111000;
    						glyphBLUE	 = 12'b001100111000;
    						glyphGREEN	 = 12'b001100111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_T:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_U:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_V:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001100010000;
    						glyphBLUE	 = 12'b001100010000;
    						glyphGREEN	 = 12'b001100010000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001110111000;
    						glyphBLUE	 = 12'b001110111000;
    						glyphGREEN	 = 12'b001110111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_W:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011100001100;
    						glyphBLUE	 = 12'b011100001100;
    						glyphGREEN	 = 12'b011100001100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011100001100;
    						glyphBLUE	 = 12'b011100001100;
    						glyphGREEN	 = 12'b011100001100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011100001100;
    						glyphBLUE	 = 12'b011100001100;
    						glyphGREEN	 = 12'b011100001100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011100001100;
    						glyphBLUE	 = 12'b011100001100;
    						glyphGREEN	 = 12'b011100001100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011101101100;
    						glyphBLUE	 = 12'b011101101100;
    						glyphGREEN	 = 12'b011101101100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011101101100;
    						glyphBLUE	 = 12'b011101101100;
    						glyphGREEN	 = 12'b011101101100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011101101100;
    						glyphBLUE	 = 12'b011101101100;
    						glyphGREEN	 = 12'b011101101100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011101101100;
    						glyphBLUE	 = 12'b011101101100;
    						glyphGREEN	 = 12'b011101101100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000110011000;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_X:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111000011000;
    						glyphBLUE	 = 12'b111000011000;
    						glyphGREEN	 = 12'b111000011000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111000011000;
    						glyphBLUE	 = 12'b111000011000;
    						glyphGREEN	 = 12'b111000011000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111000011000;
    						glyphBLUE	 = 12'b111000011000;
    						glyphGREEN	 = 12'b111000011000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011000010000;
    						glyphBLUE	 = 12'b011000010000;
    						glyphGREEN	 = 12'b011000010000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001100110000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001001100000;
    						glyphBLUE	 = 12'b001001100000;
    						glyphGREEN	 = 12'b001001100000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011000110000;
    						glyphBLUE	 = 12'b011000110000;
    						glyphGREEN	 = 12'b011000110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111000111000;
    						glyphBLUE	 = 12'b111000111000;
    						glyphGREEN	 = 12'b111000111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111000111000;
    						glyphBLUE	 = 12'b111000111000;
    						glyphGREEN	 = 12'b111000111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_Y:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001000010000;
    						glyphBLUE	 = 12'b001000010000;
    						glyphGREEN	 = 12'b001000010000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011000011000;
    						glyphBLUE	 = 12'b011000011000;
    						glyphGREEN	 = 12'b011000011000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011000011000;
    						glyphBLUE	 = 12'b011000011000;
    						glyphGREEN	 = 12'b011000011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011000011000;
    						glyphBLUE	 = 12'b011000011000;
    						glyphGREEN	 = 12'b011000011000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011000011000;
    						glyphBLUE	 = 12'b011000011000;
    						glyphGREEN	 = 12'b011000011000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		LETTER_Z:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011000;
    						glyphBLUE	 = 12'b000000011000;
    						glyphGREEN	 = 12'b000000011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001110000;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001110000000;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_DOWN_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_DOWN_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_DOWN_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_DOWN_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_DOWN_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_DOWN_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_DOWN_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_LEFT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011011101110;
    						glyphBLUE	 = 12'b011011101110;
    						glyphGREEN	 = 12'b000010001000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_LEFT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000110011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011011101;
    						glyphBLUE	 = 12'b000011011101;
    						glyphGREEN	 = 12'b000000010001;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011001100;
    						glyphBLUE	 = 12'b000011001100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_LEFT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_LEFT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000011011;
    						glyphBLUE	 = 12'b000000011011;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000011001;
    						glyphBLUE	 = 12'b000000011001;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_LEFT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b101110000000;
    						glyphBLUE	 = 12'b101110000000;
    						glyphGREEN	 = 12'b001000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b100110000000;
    						glyphBLUE	 = 12'b100110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_LEFT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_LEFT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b110011000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011101110000;
    						glyphBLUE	 = 12'b011101110000;
    						glyphGREEN	 = 12'b010001000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001100110000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_RIGHT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011101110110;
    						glyphBLUE	 = 12'b011101110110;
    						glyphGREEN	 = 12'b000100010000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_RIGHT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000110011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011101110;
    						glyphBLUE	 = 12'b000011101110;
    						glyphGREEN	 = 12'b000000100010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011001100;
    						glyphBLUE	 = 12'b000011001100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_RIGHT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_RIGHT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000011101;
    						glyphBLUE	 = 12'b000000011101;
    						glyphGREEN	 = 12'b000000000100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000011001;
    						glyphBLUE	 = 12'b000000011001;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_RIGHT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110110000000;
    						glyphBLUE	 = 12'b110110000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b100110000000;
    						glyphBLUE	 = 12'b100110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_RIGHT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_RIGHT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b110011000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b101110110000;
    						glyphBLUE	 = 12'b101110110000;
    						glyphGREEN	 = 12'b100010000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001100110000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_UP_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_UP_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_UP_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_UP_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_UP_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_UP_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		MGHOST_UP_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b011101101110;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b011111111110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b011001100110;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		NUMBER_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011110111100;
    						glyphBLUE	 = 12'b011110111100;
    						glyphGREEN	 = 12'b011110111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001110111000;
    						glyphBLUE	 = 12'b001110111000;
    						glyphGREEN	 = 12'b001110111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		NUMBER_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111000000;
    						glyphBLUE	 = 12'b001111000000;
    						glyphGREEN	 = 12'b001111000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111000000;
    						glyphBLUE	 = 12'b011111000000;
    						glyphGREEN	 = 12'b011111000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011000000;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		NUMBER_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001110000;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001110000000;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		NUMBER_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000011000;
    						glyphBLUE	 = 12'b000000011000;
    						glyphGREEN	 = 12'b000000011000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011111000;
    						glyphBLUE	 = 12'b000011111000;
    						glyphGREEN	 = 12'b000011111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100011100;
    						glyphBLUE	 = 12'b011100011100;
    						glyphGREEN	 = 12'b011100011100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		NUMBER_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000100010000;
    						glyphBLUE	 = 12'b000100010000;
    						glyphGREEN	 = 12'b000100010000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001100110000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001100110000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001100110000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001100110000;
    						glyphBLUE	 = 12'b001100110000;
    						glyphGREEN	 = 12'b001100110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011000110000;
    						glyphBLUE	 = 12'b011000110000;
    						glyphGREEN	 = 12'b011000110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b000000110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b000000110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b000000110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		NUMBER_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001110000000;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001110000000;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111100000;
    						glyphBLUE	 = 12'b001111100000;
    						glyphGREEN	 = 12'b001111100000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000001110000;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b011111100000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		NUMBER_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111100000;
    						glyphBLUE	 = 12'b001111100000;
    						glyphGREEN	 = 12'b001111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		NUMBER_7:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001110000000;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001110000000;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001110000000;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		NUMBER_8:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011100111000;
    						glyphBLUE	 = 12'b011100111000;
    						glyphGREEN	 = 12'b011100111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011101111000;
    						glyphBLUE	 = 12'b011101111000;
    						glyphGREEN	 = 12'b011101111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111110000;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001101110000;
    						glyphBLUE	 = 12'b001101110000;
    						glyphGREEN	 = 12'b001101110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011100111000;
    						glyphBLUE	 = 12'b011100111000;
    						glyphGREEN	 = 12'b011100111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		NUMBER_9:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011100011000;
    						glyphBLUE	 = 12'b011100011000;
    						glyphGREEN	 = 12'b011100011000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b011111111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111100000;
    						glyphBLUE	 = 12'b001111100000;
    						glyphGREEN	 = 12'b001111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_DOWN_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111100111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111110110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111110110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_DOWN_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111100111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111110110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111110110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_DOWN_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_DOWN_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_DOWN_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111100111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111110110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111110110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_DOWN_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_DOWN_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111100111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111110110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111110110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_LEFT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011001111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011001111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111101111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111101111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_LEFT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111101111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111101111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_LEFT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_LEFT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011001;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000111101;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111101;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_LEFT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_LEFT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_LEFT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b101111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b101111111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_DOWN1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_DOWN2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111100111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111110110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111110110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_DOWN3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111100111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111110110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111110110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_LEFT1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001100111;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100111;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_LEFT2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011001;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001111101;
    						glyphBLUE	 = 12'b000001000000;
    						glyphGREEN	 = 12'b000001111101;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_LEFT3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111101111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111101111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_RIGHT1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b111001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b111001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_RIGHT2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b101111100000;
    						glyphBLUE	 = 12'b000000100000;
    						glyphGREEN	 = 12'b101111100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000100000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_RIGHT3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111100110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111101111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111101111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_UP1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_UP2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011011111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011011111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111001111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_PILL_UP3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011011111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011011111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111001111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_RIGHT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111100110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111100110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111101111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111101111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_RIGHT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111111101;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111101;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_RIGHT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_RIGHT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_RIGHT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b101111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b101111000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_RIGHT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_RIGHT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111100110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111101111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111101111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_UP_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011011111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011011111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111001111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_UP_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011011111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011011111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111001111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_UP_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_UP_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011011111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011011111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111001111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_UP_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_UP_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANCLOSED_UP_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011011111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011011111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111001111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_DOWN_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110110011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110110011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111110011011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110011011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_DOWN_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111110110011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110110011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111110011011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110011011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_DOWN_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_DOWN_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_DOWN_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111110110011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110110011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111110011011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110011011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_DOWN_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_DOWN_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111110110011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110110011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111110011011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110011011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_LEFT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111100111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001110111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001110111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_LEFT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000001111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111100111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111100111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001110111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001110111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000001111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_LEFT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_LEFT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000001110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_LEFT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_LEFT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_LEFT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b100111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_DOWN1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_DOWN2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111110110011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110110011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111110011011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110011011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001011110100;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b001011110100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_DOWN3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111110110011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110110011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111011;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b111111111011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_LEFT1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_LEFT2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000001110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001100011;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110001;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110001;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100011;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_LEFT3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000001111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111100111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111100111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001110111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001110111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000001111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_RIGHT1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_RIGHT2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b110001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b100011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b100011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b110001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_RIGHT3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111001111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111001111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111011100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111011100000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_UP1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_UP2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001011110100;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b001011110100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110110011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110110011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110011011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110011011111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_PILL_UP3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b011001100110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110111111111;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b110111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110011011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110011011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_RIGHT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111011100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111011100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_RIGHT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011111001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111001;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011111011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_RIGHT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_RIGHT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_RIGHT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_RIGHT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_RIGHT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111001111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111001111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111011100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111011100000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_DOWN1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001011110100;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b001011110100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_DOWN2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111110110011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110110011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111110011011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110011011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_DOWN3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111110011;
    						glyphBLUE	 = 12'b000001000000;
    						glyphGREEN	 = 12'b111111110011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111011;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b111111111011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_LEFT1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111111001;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111001;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111111001;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111001;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_LEFT2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011111100;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111111110;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111101;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111101;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_LEFT3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000001111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111100111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111100111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111110111;
    						glyphBLUE	 = 12'b000110000000;
    						glyphGREEN	 = 12'b000111110111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b001111100000;
    						glyphGREEN	 = 12'b001111111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b001111100000;
    						glyphGREEN	 = 12'b001111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000110000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000001111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000001111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_RIGHT1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b100111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b100111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b100111111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_RIGHT2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111000;
    						glyphBLUE	 = 12'b000011111000;
    						glyphGREEN	 = 12'b011111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b101111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b101111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000011111000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_RIGHT3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111001111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111001111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111011111000;
    						glyphBLUE	 = 12'b000000011000;
    						glyphGREEN	 = 12'b111011111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b000001111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b000011111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b000111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b000001111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000011000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_UP1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001011110100;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b001011110100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_UP2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110110011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110110011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110011011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110011011111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_SUPERPILL_UP3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110111111111;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b110111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110011111111;
    						glyphBLUE	 = 12'b000000100000;
    						glyphGREEN	 = 12'b110011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_UP_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110110011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110110011111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110011011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110011011111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_UP_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110110011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110110011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110011011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110011011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_UP_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_UP_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110110011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110110011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110011011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110011011111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_UP_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_UP_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001000000100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011000000110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011000000110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PMANOPEN_UP_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110110011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110110011111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110011011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b110011011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		PILL:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_DOWN_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_DOWN_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_DOWN_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_DOWN_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_DOWN_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_DOWN_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_DOWN_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_LEFT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011011101110;
    						glyphBLUE	 = 12'b000010001000;
    						glyphGREEN	 = 12'b000010001000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_LEFT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000110011;
    						glyphGREEN	 = 12'b000000110011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011011101;
    						glyphBLUE	 = 12'b000000010001;
    						glyphGREEN	 = 12'b000000010001;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011001100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_LEFT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_LEFT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000110;
    						glyphGREEN	 = 12'b000000000110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000011011;
    						glyphBLUE	 = 12'b000000000010;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000011001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_LEFT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b101110000000;
    						glyphBLUE	 = 12'b001000000000;
    						glyphGREEN	 = 12'b001000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b100110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_LEFT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_LEFT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b110011000000;
    						glyphGREEN	 = 12'b110011000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011101110000;
    						glyphBLUE	 = 12'b010001000000;
    						glyphGREEN	 = 12'b010001000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001100110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_RIGHT_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011101110110;
    						glyphBLUE	 = 12'b000100010000;
    						glyphGREEN	 = 12'b000100010000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_RIGHT_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000110011;
    						glyphGREEN	 = 12'b000000110011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011101110;
    						glyphBLUE	 = 12'b000000100010;
    						glyphGREEN	 = 12'b000000100010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011001100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_RIGHT_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_RIGHT_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000110;
    						glyphGREEN	 = 12'b000000000110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000011101;
    						glyphBLUE	 = 12'b000000000100;
    						glyphGREEN	 = 12'b000000000100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000011001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_RIGHT_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b011000000000;
    						glyphGREEN	 = 12'b011000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110110000000;
    						glyphBLUE	 = 12'b010000000000;
    						glyphGREEN	 = 12'b010000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_RIGHT_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_RIGHT_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b110011000000;
    						glyphGREEN	 = 12'b110011000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b101110110000;
    						glyphBLUE	 = 12'b100010000000;
    						glyphGREEN	 = 12'b100010000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001100110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_UP_0:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_UP_1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_UP_2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_UP_3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_UP_4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_UP_5:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		RGHOST_UP_6:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011101101110;
    						glyphBLUE	 = 12'b000100001000;
    						glyphGREEN	 = 12'b000100001000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000110011000;
    						glyphGREEN	 = 12'b000110011000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011001100110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		SUPERPILL:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111100;
    						glyphBLUE	 = 12'b001111111100;
    						glyphGREEN	 = 12'b001111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_CORNER1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_CORNER2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_CORNER3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_CORNER4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_INV_CORNER1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_INV_CORNER2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_INV_CORNER3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_INV_CORNER4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b001111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_SIDE1:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_SIDE2:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_SIDE3:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WALL_SIDE4:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		WATERMELON:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000001100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000010100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011010100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000010;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001010110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000001100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000011000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_01:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_02:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_03:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b011111100000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_04:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b111111111000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_05:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_06:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000001111110;
    						glyphBLUE	 = 12'b000001111110;
    						glyphGREEN	 = 12'b000001111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b100000000111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_07:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_08:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_09:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_10:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111100001;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111000011;
    						glyphBLUE	 = 12'b001111000000;
    						glyphGREEN	 = 12'b001111000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011110000111;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011100001111;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111000011111;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_11:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111000000011;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_12:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_13:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_14:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_15:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111000000;
    						glyphBLUE	 = 12'b001111000000;
    						glyphGREEN	 = 12'b001111000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b100000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b110000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111000001110;
    						glyphBLUE	 = 12'b000000001110;
    						glyphGREEN	 = 12'b000000001110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100000111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111110000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111100001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_16:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_17:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000110;
    						glyphBLUE	 = 12'b000000000110;
    						glyphGREEN	 = 12'b000000000110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000001110;
    						glyphBLUE	 = 12'b000000001110;
    						glyphGREEN	 = 12'b000000001110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000001110;
    						glyphBLUE	 = 12'b000000001110;
    						glyphGREEN	 = 12'b000000001110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000011000;
    						glyphBLUE	 = 12'b000000011000;
    						glyphGREEN	 = 12'b000000011000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_18:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000111111;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000111111;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b100001111111;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100011111111;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_19:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_20:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_21:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_22:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011111100;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011111100;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011111100;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_23:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_24:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001110000000;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001110000000;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b100011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b100001100000;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100001110000;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110001110000;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_25:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b000000110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000001110000;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001110001;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001110001;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001100001;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000001100001;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100001;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011100011;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011100011;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011100011;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011100011;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_26:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_27:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_28:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_29:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_30:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011111100;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011111100;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011111100;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011111100;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000011111100;
    						glyphGREEN	 = 12'b000011111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b011111110000;
    						glyphGREEN	 = 12'b011111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111100000;
    						glyphGREEN	 = 12'b111111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_31:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_32:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b000000110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111000011000;
    						glyphBLUE	 = 12'b000000011000;
    						glyphGREEN	 = 12'b000000011000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111000011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_33:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011100011;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011100011;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011100011;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011100011;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011100011;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011100001;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000001100001;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001100001;
    						glyphBLUE	 = 12'b000001100000;
    						glyphGREEN	 = 12'b000001100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001110001;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000001110001;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001110001;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b000000110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_34:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_35:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_36:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_37:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000111111;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000111111;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_38:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_39:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_40:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111100011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111000011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111000011000;
    						glyphBLUE	 = 12'b000000011000;
    						glyphGREEN	 = 12'b000000011000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_41:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000111000;
    						glyphBLUE	 = 12'b000000111000;
    						glyphGREEN	 = 12'b000000111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000011100;
    						glyphBLUE	 = 12'b000000011100;
    						glyphGREEN	 = 12'b000000011100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000001110;
    						glyphBLUE	 = 12'b000000001110;
    						glyphGREEN	 = 12'b000000001110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000001110;
    						glyphBLUE	 = 12'b000000001110;
    						glyphGREEN	 = 12'b000000001110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000001110;
    						glyphBLUE	 = 12'b000000001110;
    						glyphGREEN	 = 12'b000000001110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_42:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100001111111;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000111111;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_43:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_44:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_45:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_46:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111000000;
    						glyphGREEN	 = 12'b111111000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b011111100000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_47:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_48:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000110000;
    						glyphBLUE	 = 12'b000000110000;
    						glyphGREEN	 = 12'b000000110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110001110000;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110001110000;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100001110000;
    						glyphBLUE	 = 12'b000001110000;
    						glyphGREEN	 = 12'b000001110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111000000;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001110000000;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001110000000;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011100000000;
    						glyphBLUE	 = 12'b011100000000;
    						glyphGREEN	 = 12'b011100000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_49:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_50:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000111111;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111000011111;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011110000111;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001110000011;
    						glyphBLUE	 = 12'b001110000000;
    						glyphGREEN	 = 12'b001110000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111000001;
    						glyphBLUE	 = 12'b000111000000;
    						glyphGREEN	 = 12'b000111000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_51:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b100000001111;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_52:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_53:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_54:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b011111100000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000111111100;
    						glyphGREEN	 = 12'b000111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111111100000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_55:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111100001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111110000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111100000111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b110000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b100000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111100000;
    						glyphBLUE	 = 12'b001111100000;
    						glyphGREEN	 = 12'b001111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_56:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_57:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_58:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_59:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111000000011;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b011111100000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111111000;
    						glyphBLUE	 = 12'b000111111000;
    						glyphGREEN	 = 12'b000111111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001111110;
    						glyphBLUE	 = 12'b000001111110;
    						glyphGREEN	 = 12'b000001111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_60:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_61:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_62:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111111100;
    						glyphBLUE	 = 12'b000111111100;
    						glyphGREEN	 = 12'b000111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110000000;
    						glyphBLUE	 = 12'b111110000000;
    						glyphGREEN	 = 12'b111110000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_63:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b100000000000;
    						glyphBLUE	 = 12'b100000000000;
    						glyphGREEN	 = 12'b100000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZCIRCLER_64:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_01:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_02:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110000000011;
    						glyphBLUE	 = 12'b110000000011;
    						glyphGREEN	 = 12'b110000000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111100000011;
    						glyphBLUE	 = 12'b111100000011;
    						glyphGREEN	 = 12'b111100000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110000011;
    						glyphBLUE	 = 12'b111110000011;
    						glyphGREEN	 = 12'b111110000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111110000011;
    						glyphBLUE	 = 12'b111110000011;
    						glyphGREEN	 = 12'b111110000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111000011;
    						glyphBLUE	 = 12'b011111000011;
    						glyphGREEN	 = 12'b011111000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111000011;
    						glyphBLUE	 = 12'b011111000011;
    						glyphGREEN	 = 12'b011111000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111000011;
    						glyphBLUE	 = 12'b001111000011;
    						glyphGREEN	 = 12'b001111000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111100011;
    						glyphBLUE	 = 12'b001111100011;
    						glyphGREEN	 = 12'b001111100011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_03:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_04:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000111110;
    						glyphBLUE	 = 12'b000000111110;
    						glyphGREEN	 = 12'b000000111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b001111111111;
    						glyphGREEN	 = 12'b001111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111100011;
    						glyphBLUE	 = 12'b001111100011;
    						glyphGREEN	 = 12'b001111100011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011111000001;
    						glyphBLUE	 = 12'b011111000001;
    						glyphGREEN	 = 12'b011111000001;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_05:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100000011110;
    						glyphBLUE	 = 12'b100000011110;
    						glyphGREEN	 = 12'b100000011110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110000011110;
    						glyphBLUE	 = 12'b110000011110;
    						glyphGREEN	 = 12'b110000011110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111000011110;
    						glyphBLUE	 = 12'b111000011110;
    						glyphGREEN	 = 12'b111000011110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111000011110;
    						glyphBLUE	 = 12'b111000011110;
    						glyphGREEN	 = 12'b111000011110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111000011110;
    						glyphBLUE	 = 12'b111000011110;
    						glyphGREEN	 = 12'b111000011110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_06:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_07:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100000001111;
    						glyphBLUE	 = 12'b100000001111;
    						glyphGREEN	 = 12'b100000001111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b111000001111;
    						glyphGREEN	 = 12'b111000001111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b111100001111;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_08:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b100000011110;
    						glyphBLUE	 = 12'b100000011110;
    						glyphGREEN	 = 12'b100000011110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b100000011110;
    						glyphBLUE	 = 12'b100000011110;
    						glyphGREEN	 = 12'b100000011110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000011110;
    						glyphBLUE	 = 12'b110000011110;
    						glyphGREEN	 = 12'b110000011110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000011110;
    						glyphBLUE	 = 12'b110000011110;
    						glyphGREEN	 = 12'b110000011110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000011110;
    						glyphBLUE	 = 12'b110000011110;
    						glyphGREEN	 = 12'b110000011110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111000011110;
    						glyphBLUE	 = 12'b111000011110;
    						glyphGREEN	 = 12'b111000011110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_09:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_10:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_11:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_12:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011111000000;
    						glyphBLUE	 = 12'b011111000000;
    						glyphGREEN	 = 12'b011111000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011111100000;
    						glyphBLUE	 = 12'b011111100000;
    						glyphGREEN	 = 12'b011111100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111111100;
    						glyphBLUE	 = 12'b000111111100;
    						glyphGREEN	 = 12'b000111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011111110;
    						glyphBLUE	 = 12'b000011111110;
    						glyphGREEN	 = 12'b000011111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000111;
    						glyphBLUE	 = 12'b000000000111;
    						glyphGREEN	 = 12'b000000000111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_13:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b100000011110;
    						glyphBLUE	 = 12'b100000011110;
    						glyphGREEN	 = 12'b100000011110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110000011110;
    						glyphBLUE	 = 12'b110000011110;
    						glyphGREEN	 = 12'b110000011110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111000011110;
    						glyphBLUE	 = 12'b111000011110;
    						glyphGREEN	 = 12'b111000011110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111000011110;
    						glyphBLUE	 = 12'b111000011110;
    						glyphGREEN	 = 12'b111000011110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_14:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_15:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_16:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111000011110;
    						glyphBLUE	 = 12'b111000011110;
    						glyphGREEN	 = 12'b111000011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111110011110;
    						glyphBLUE	 = 12'b111110011110;
    						glyphGREEN	 = 12'b111110011110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111110011110;
    						glyphBLUE	 = 12'b111110011110;
    						glyphGREEN	 = 12'b111110011110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011110011110;
    						glyphBLUE	 = 12'b011110011110;
    						glyphGREEN	 = 12'b011110011110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111011110;
    						glyphBLUE	 = 12'b011111011110;
    						glyphGREEN	 = 12'b011111011110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111011110;
    						glyphBLUE	 = 12'b011111011110;
    						glyphGREEN	 = 12'b011111011110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111111110;
    						glyphBLUE	 = 12'b001111111110;
    						glyphGREEN	 = 12'b001111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111111110;
    						glyphBLUE	 = 12'b001111111110;
    						glyphGREEN	 = 12'b001111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111111110;
    						glyphBLUE	 = 12'b000111111110;
    						glyphGREEN	 = 12'b000111111110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111111110;
    						glyphBLUE	 = 12'b000111111110;
    						glyphGREEN	 = 12'b000111111110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_17:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_18:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111100011;
    						glyphBLUE	 = 12'b001111100011;
    						glyphGREEN	 = 12'b001111100011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111000011;
    						glyphBLUE	 = 12'b001111000011;
    						glyphGREEN	 = 12'b001111000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111000011;
    						glyphBLUE	 = 12'b011111000011;
    						glyphGREEN	 = 12'b011111000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111000011;
    						glyphBLUE	 = 12'b011111000011;
    						glyphGREEN	 = 12'b011111000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110000011;
    						glyphBLUE	 = 12'b111110000011;
    						glyphGREEN	 = 12'b111110000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111110000011;
    						glyphBLUE	 = 12'b111110000011;
    						glyphGREEN	 = 12'b111110000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100000011;
    						glyphBLUE	 = 12'b111100000011;
    						glyphGREEN	 = 12'b111100000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000011;
    						glyphBLUE	 = 12'b110000000011;
    						glyphGREEN	 = 12'b110000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_19:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_20:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011110000000;
    						glyphBLUE	 = 12'b011110000000;
    						glyphGREEN	 = 12'b011110000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011110000001;
    						glyphBLUE	 = 12'b011110000001;
    						glyphGREEN	 = 12'b011110000001;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111000011;
    						glyphBLUE	 = 12'b001111000011;
    						glyphGREEN	 = 12'b001111000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111111111;
    						glyphBLUE	 = 12'b001111111111;
    						glyphGREEN	 = 12'b001111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000111110;
    						glyphBLUE	 = 12'b000000111110;
    						glyphGREEN	 = 12'b000000111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_21:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111000011110;
    						glyphBLUE	 = 12'b111000011110;
    						glyphGREEN	 = 12'b111000011110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111000011110;
    						glyphBLUE	 = 12'b111000011110;
    						glyphGREEN	 = 12'b111000011110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b110000011110;
    						glyphBLUE	 = 12'b110000011110;
    						glyphGREEN	 = 12'b110000011110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110000011110;
    						glyphBLUE	 = 12'b110000011110;
    						glyphGREEN	 = 12'b110000011110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b100000011110;
    						glyphBLUE	 = 12'b100000011110;
    						glyphGREEN	 = 12'b100000011110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_22:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_23:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b111100001111;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b111000001111;
    						glyphGREEN	 = 12'b111000001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b100000001111;
    						glyphBLUE	 = 12'b100000001111;
    						glyphGREEN	 = 12'b100000001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZDESIGN_24:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000111111110;
    						glyphBLUE	 = 12'b000111111110;
    						glyphGREEN	 = 12'b000111111110;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011111110;
    						glyphBLUE	 = 12'b000011111110;
    						glyphGREEN	 = 12'b000011111110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011111110;
    						glyphBLUE	 = 12'b000011111110;
    						glyphGREEN	 = 12'b000011111110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001111110;
    						glyphBLUE	 = 12'b000001111110;
    						glyphGREEN	 = 12'b000001111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001111110;
    						glyphBLUE	 = 12'b000001111110;
    						glyphGREEN	 = 12'b000001111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111110;
    						glyphBLUE	 = 12'b000001111110;
    						glyphGREEN	 = 12'b000001111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000111110;
    						glyphBLUE	 = 12'b000000111110;
    						glyphGREEN	 = 12'b000000111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000111110;
    						glyphBLUE	 = 12'b000000111110;
    						glyphGREEN	 = 12'b000000111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_01:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_02:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100000000011;
    						glyphBLUE	 = 12'b100000000011;
    						glyphGREEN	 = 12'b100000000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111000000011;
    						glyphBLUE	 = 12'b111000000011;
    						glyphGREEN	 = 12'b111000000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111100000011;
    						glyphBLUE	 = 12'b111100000011;
    						glyphGREEN	 = 12'b111100000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110000011;
    						glyphBLUE	 = 12'b111110000011;
    						glyphGREEN	 = 12'b111110000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011111000011;
    						glyphBLUE	 = 12'b011111000011;
    						glyphGREEN	 = 12'b011111000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111000011;
    						glyphBLUE	 = 12'b001111000011;
    						glyphGREEN	 = 12'b001111000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b001111100011;
    						glyphBLUE	 = 12'b001111100011;
    						glyphGREEN	 = 12'b001111100011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_03:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_04:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b011111111111;
    						glyphGREEN	 = 12'b011111111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b011111111111;
    						glyphGREEN	 = 12'b011111111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b011111111111;
    						glyphGREEN	 = 12'b011111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011111111111;
    						glyphBLUE	 = 12'b011111111111;
    						glyphGREEN	 = 12'b011111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_05:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111001111111;
    						glyphBLUE	 = 12'b111001111111;
    						glyphGREEN	 = 12'b111001111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111001111111;
    						glyphBLUE	 = 12'b111001111111;
    						glyphGREEN	 = 12'b111001111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111001111111;
    						glyphBLUE	 = 12'b111001111111;
    						glyphGREEN	 = 12'b111001111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111001111111;
    						glyphBLUE	 = 12'b111001111111;
    						glyphGREEN	 = 12'b111001111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_06:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111110000001;
    						glyphBLUE	 = 12'b111110000001;
    						glyphGREEN	 = 12'b111110000001;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111000011;
    						glyphBLUE	 = 12'b111111000011;
    						glyphGREEN	 = 12'b111111000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111100011;
    						glyphBLUE	 = 12'b001111100011;
    						glyphGREEN	 = 12'b001111100011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000111110011;
    						glyphBLUE	 = 12'b000111110011;
    						glyphGREEN	 = 12'b000111110011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011110011;
    						glyphBLUE	 = 12'b000011110011;
    						glyphGREEN	 = 12'b000011110011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110011;
    						glyphBLUE	 = 12'b000011110011;
    						glyphGREEN	 = 12'b000011110011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_07:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111000011111;
    						glyphBLUE	 = 12'b111000011111;
    						glyphGREEN	 = 12'b111000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_08:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000001111;
    						glyphBLUE	 = 12'b000000001111;
    						glyphGREEN	 = 12'b000000001111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000011111;
    						glyphBLUE	 = 12'b000000011111;
    						glyphGREEN	 = 12'b000000011111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000111111;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000111111;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_09:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000001;
    						glyphBLUE	 = 12'b000000000001;
    						glyphGREEN	 = 12'b000000000001;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000011;
    						glyphBLUE	 = 12'b000000000011;
    						glyphGREEN	 = 12'b000000000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b100000000111;
    						glyphBLUE	 = 12'b100000000111;
    						glyphGREEN	 = 12'b100000000111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b100000000111;
    						glyphBLUE	 = 12'b100000000111;
    						glyphGREEN	 = 12'b100000000111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b100000001111;
    						glyphBLUE	 = 12'b100000001111;
    						glyphGREEN	 = 12'b100000001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b100000001111;
    						glyphBLUE	 = 12'b100000001111;
    						glyphGREEN	 = 12'b100000001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_10:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011111000000;
    						glyphBLUE	 = 12'b011111000000;
    						glyphGREEN	 = 12'b011111000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b111111111000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b111111111000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110001111100;
    						glyphBLUE	 = 12'b110001111100;
    						glyphGREEN	 = 12'b110001111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b100000111100;
    						glyphBLUE	 = 12'b100000111100;
    						glyphGREEN	 = 12'b100000111100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b100000111110;
    						glyphBLUE	 = 12'b100000111110;
    						glyphGREEN	 = 12'b100000111110;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b100000011110;
    						glyphBLUE	 = 12'b100000011110;
    						glyphGREEN	 = 12'b100000011110;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_11:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_12:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110011110011;
    						glyphBLUE	 = 12'b110011110011;
    						glyphGREEN	 = 12'b110011110011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110011110011;
    						glyphBLUE	 = 12'b110011110011;
    						glyphGREEN	 = 12'b110011110011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110011110011;
    						glyphBLUE	 = 12'b110011110011;
    						glyphGREEN	 = 12'b110011110011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b110011110011;
    						glyphBLUE	 = 12'b110011110011;
    						glyphGREEN	 = 12'b110011110011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011110011;
    						glyphBLUE	 = 12'b000011110011;
    						glyphGREEN	 = 12'b000011110011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110011;
    						glyphBLUE	 = 12'b000011110011;
    						glyphGREEN	 = 12'b000011110011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110001;
    						glyphBLUE	 = 12'b000011110001;
    						glyphGREEN	 = 12'b000011110001;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011110001;
    						glyphBLUE	 = 12'b000011110001;
    						glyphGREEN	 = 12'b000011110001;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110001;
    						glyphBLUE	 = 12'b000011110001;
    						glyphGREEN	 = 12'b000011110001;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_13:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000111;
    						glyphBLUE	 = 12'b110000000111;
    						glyphGREEN	 = 12'b110000000111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110000000111;
    						glyphBLUE	 = 12'b110000000111;
    						glyphGREEN	 = 12'b110000000111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110000000111;
    						glyphBLUE	 = 12'b110000000111;
    						glyphGREEN	 = 12'b110000000111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b110000000111;
    						glyphBLUE	 = 12'b110000000111;
    						glyphGREEN	 = 12'b110000000111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110000000111;
    						glyphBLUE	 = 12'b110000000111;
    						glyphGREEN	 = 12'b110000000111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000111;
    						glyphBLUE	 = 12'b110000000111;
    						glyphGREEN	 = 12'b110000000111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b111000001111;
    						glyphGREEN	 = 12'b111000001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b111000001111;
    						glyphGREEN	 = 12'b111000001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b111000001111;
    						glyphGREEN	 = 12'b111000001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_14:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100111111111;
    						glyphBLUE	 = 12'b100111111111;
    						glyphGREEN	 = 12'b100111111111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100111111111;
    						glyphBLUE	 = 12'b100111111111;
    						glyphGREEN	 = 12'b100111111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b100111111111;
    						glyphBLUE	 = 12'b100111111111;
    						glyphGREEN	 = 12'b100111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b100111111111;
    						glyphBLUE	 = 12'b100111111111;
    						glyphGREEN	 = 12'b100111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b100111100000;
    						glyphBLUE	 = 12'b100111100000;
    						glyphGREEN	 = 12'b100111100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b100111100000;
    						glyphBLUE	 = 12'b100111100000;
    						glyphGREEN	 = 12'b100111100000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_15:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_16:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011111111;
    						glyphBLUE	 = 12'b000011111111;
    						glyphGREEN	 = 12'b000011111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110001;
    						glyphBLUE	 = 12'b000011110001;
    						glyphGREEN	 = 12'b000011110001;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110001;
    						glyphBLUE	 = 12'b000011110001;
    						glyphGREEN	 = 12'b000011110001;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_17:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111000011;
    						glyphBLUE	 = 12'b001111000011;
    						glyphGREEN	 = 12'b001111000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111000011;
    						glyphBLUE	 = 12'b011111000011;
    						glyphGREEN	 = 12'b011111000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111110000011;
    						glyphBLUE	 = 12'b111110000011;
    						glyphGREEN	 = 12'b111110000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111100000011;
    						glyphBLUE	 = 12'b111100000011;
    						glyphGREEN	 = 12'b111100000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111000000011;
    						glyphBLUE	 = 12'b111000000011;
    						glyphGREEN	 = 12'b111000000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111000000011;
    						glyphBLUE	 = 12'b111000000011;
    						glyphGREEN	 = 12'b111000000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111000000011;
    						glyphBLUE	 = 12'b111000000011;
    						glyphGREEN	 = 12'b111000000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111000000011;
    						glyphBLUE	 = 12'b111000000011;
    						glyphGREEN	 = 12'b111000000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111100000011;
    						glyphBLUE	 = 12'b111100000011;
    						glyphGREEN	 = 12'b111100000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_18:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_19:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_20:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001111111;
    						glyphBLUE	 = 12'b000001111111;
    						glyphGREEN	 = 12'b000001111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_21:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110011;
    						glyphBLUE	 = 12'b000011110011;
    						glyphGREEN	 = 12'b000011110011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110011;
    						glyphBLUE	 = 12'b000011110011;
    						glyphGREEN	 = 12'b000011110011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110011;
    						glyphBLUE	 = 12'b000011110011;
    						glyphGREEN	 = 12'b000011110011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111100011;
    						glyphBLUE	 = 12'b001111100011;
    						glyphGREEN	 = 12'b001111100011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111000011;
    						glyphBLUE	 = 12'b111111000011;
    						glyphGREEN	 = 12'b111111000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111110000011;
    						glyphBLUE	 = 12'b111110000011;
    						glyphGREEN	 = 12'b111110000011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111100000011;
    						glyphBLUE	 = 12'b111100000011;
    						glyphGREEN	 = 12'b111100000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100000011;
    						glyphBLUE	 = 12'b111100000011;
    						glyphGREEN	 = 12'b111100000011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111100000011;
    						glyphBLUE	 = 12'b111100000011;
    						glyphGREEN	 = 12'b111100000011;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b011100000011;
    						glyphBLUE	 = 12'b011100000011;
    						glyphGREEN	 = 12'b011100000011;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b011110000011;
    						glyphBLUE	 = 12'b011110000011;
    						glyphGREEN	 = 12'b011110000011;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_22:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_23:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000111111;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000111111;
    						glyphBLUE	 = 12'b000000111111;
    						glyphGREEN	 = 12'b000000111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000001111001;
    						glyphBLUE	 = 12'b000001111001;
    						glyphGREEN	 = 12'b000001111001;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001111001;
    						glyphBLUE	 = 12'b000001111001;
    						glyphGREEN	 = 12'b000001111001;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001111001;
    						glyphBLUE	 = 12'b000001111001;
    						glyphGREEN	 = 12'b000001111001;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111001;
    						glyphBLUE	 = 12'b000001111001;
    						glyphGREEN	 = 12'b000001111001;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_24:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b111000001111;
    						glyphGREEN	 = 12'b111000001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b111000001111;
    						glyphGREEN	 = 12'b111000001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b111000001111;
    						glyphGREEN	 = 12'b111000001111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b111000001111;
    						glyphGREEN	 = 12'b111000001111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b111000001111;
    						glyphGREEN	 = 12'b111000001111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b111100001111;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b111100001111;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b111100001111;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b111100001111;
    						glyphBLUE	 = 12'b111100001111;
    						glyphGREEN	 = 12'b111100001111;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_25:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_26:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_27:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110001;
    						glyphBLUE	 = 12'b000011110001;
    						glyphGREEN	 = 12'b000011110001;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_28:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111000001111;
    						glyphBLUE	 = 12'b111000001111;
    						glyphGREEN	 = 12'b111000001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111100011110;
    						glyphBLUE	 = 12'b111100011110;
    						glyphGREEN	 = 12'b111100011110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b011110111100;
    						glyphBLUE	 = 12'b011110111100;
    						glyphGREEN	 = 12'b011110111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b011110111100;
    						glyphBLUE	 = 12'b011110111100;
    						glyphGREEN	 = 12'b011110111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b011110111100;
    						glyphBLUE	 = 12'b011110111100;
    						glyphGREEN	 = 12'b011110111100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011110111100;
    						glyphBLUE	 = 12'b011110111100;
    						glyphGREEN	 = 12'b011110111100;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_29:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_30:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111000000000;
    						glyphBLUE	 = 12'b111000000000;
    						glyphGREEN	 = 12'b111000000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_31:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_32:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111100000011;
    						glyphBLUE	 = 12'b111100000011;
    						glyphGREEN	 = 12'b111100000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111100000011;
    						glyphBLUE	 = 12'b111100000011;
    						glyphGREEN	 = 12'b111100000011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b011110000011;
    						glyphBLUE	 = 12'b011110000011;
    						glyphGREEN	 = 12'b011110000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011110000011;
    						glyphBLUE	 = 12'b011110000011;
    						glyphGREEN	 = 12'b011110000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011110000011;
    						glyphBLUE	 = 12'b011110000011;
    						glyphGREEN	 = 12'b011110000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111000011;
    						glyphBLUE	 = 12'b001111000011;
    						glyphGREEN	 = 12'b001111000011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111100011;
    						glyphBLUE	 = 12'b001111100011;
    						glyphGREEN	 = 12'b001111100011;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111100011;
    						glyphBLUE	 = 12'b001111100011;
    						glyphGREEN	 = 12'b001111100011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_33:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b110000000000;
    						glyphBLUE	 = 12'b110000000000;
    						glyphGREEN	 = 12'b110000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_34:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000000111100;
    						glyphBLUE	 = 12'b000000111100;
    						glyphGREEN	 = 12'b000000111100;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_35:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_36:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b011110000011;
    						glyphBLUE	 = 12'b011110000011;
    						glyphGREEN	 = 12'b011110000011;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b011110000011;
    						glyphBLUE	 = 12'b011110000011;
    						glyphGREEN	 = 12'b011110000011;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111000011;
    						glyphBLUE	 = 12'b001111000011;
    						glyphGREEN	 = 12'b001111000011;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b001111000011;
    						glyphBLUE	 = 12'b001111000011;
    						glyphGREEN	 = 12'b001111000011;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111000011;
    						glyphBLUE	 = 12'b001111000011;
    						glyphGREEN	 = 12'b001111000011;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111100011;
    						glyphBLUE	 = 12'b000111100011;
    						glyphGREEN	 = 12'b000111100011;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111110001;
    						glyphBLUE	 = 12'b000111110001;
    						glyphGREEN	 = 12'b000111110001;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_37:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b110000001111;
    						glyphBLUE	 = 12'b110000001111;
    						glyphGREEN	 = 12'b110000001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b111000011111;
    						glyphBLUE	 = 12'b111000011111;
    						glyphGREEN	 = 12'b111000011111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111111111111;
    						glyphBLUE	 = 12'b111111111111;
    						glyphGREEN	 = 12'b111111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111110;
    						glyphBLUE	 = 12'b111111111110;
    						glyphGREEN	 = 12'b111111111110;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111110000;
    						glyphBLUE	 = 12'b001111110000;
    						glyphGREEN	 = 12'b001111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_38:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b001111100000;
    						glyphBLUE	 = 12'b001111100000;
    						glyphGREEN	 = 12'b001111100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b001111100000;
    						glyphBLUE	 = 12'b001111100000;
    						glyphGREEN	 = 12'b001111100000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111000000;
    						glyphBLUE	 = 12'b001111000000;
    						glyphGREEN	 = 12'b001111000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111000000;
    						glyphBLUE	 = 12'b001111000000;
    						glyphGREEN	 = 12'b001111000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111000000;
    						glyphBLUE	 = 12'b001111000000;
    						glyphGREEN	 = 12'b001111000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_39:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b111110001111;
    						glyphBLUE	 = 12'b111110001111;
    						glyphGREEN	 = 12'b111110001111;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b011110001111;
    						glyphBLUE	 = 12'b011110001111;
    						glyphGREEN	 = 12'b011110001111;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b011111001111;
    						glyphBLUE	 = 12'b011111001111;
    						glyphGREEN	 = 12'b011111001111;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b011111000111;
    						glyphBLUE	 = 12'b011111000111;
    						glyphGREEN	 = 12'b011111000111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b001111000111;
    						glyphBLUE	 = 12'b001111000111;
    						glyphGREEN	 = 12'b001111000111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b001111000011;
    						glyphBLUE	 = 12'b001111000011;
    						glyphGREEN	 = 12'b001111000011;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b001111000001;
    						glyphBLUE	 = 12'b001111000001;
    						glyphGREEN	 = 12'b001111000001;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_40:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000011110;
    						glyphBLUE	 = 12'b000000011110;
    						glyphGREEN	 = 12'b000000011110;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b100000011110;
    						glyphBLUE	 = 12'b100000011110;
    						glyphGREEN	 = 12'b100000011110;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b100000111110;
    						glyphBLUE	 = 12'b100000111110;
    						glyphGREEN	 = 12'b100000111110;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b110001111100;
    						glyphBLUE	 = 12'b110001111100;
    						glyphGREEN	 = 12'b110001111100;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111111111100;
    						glyphBLUE	 = 12'b111111111100;
    						glyphGREEN	 = 12'b111111111100;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111111111000;
    						glyphBLUE	 = 12'b111111111000;
    						glyphGREEN	 = 12'b111111111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111111110000;
    						glyphBLUE	 = 12'b111111110000;
    						glyphGREEN	 = 12'b111111110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b011111000000;
    						glyphBLUE	 = 12'b011111000000;
    						glyphGREEN	 = 12'b011111000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_41:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000001111000;
    						glyphBLUE	 = 12'b000001111000;
    						glyphGREEN	 = 12'b000001111000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_42:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011110000;
    						glyphBLUE	 = 12'b000011110000;
    						glyphGREEN	 = 12'b000011110000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_43:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b001111111000;
    						glyphBLUE	 = 12'b001111111000;
    						glyphGREEN	 = 12'b001111111000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111110000;
    						glyphBLUE	 = 12'b000111110000;
    						glyphGREEN	 = 12'b000111110000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000011100000;
    						glyphBLUE	 = 12'b000011100000;
    						glyphGREEN	 = 12'b000011100000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_44:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000111100000;
    						glyphBLUE	 = 12'b000111100000;
    						glyphGREEN	 = 12'b000111100000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b000111111111;
    						glyphBLUE	 = 12'b000111111111;
    						glyphGREEN	 = 12'b000111111111;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		ZRETRO_45:
    			case(ROW)
    				0:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				1:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				2:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				3:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				4:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				5:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				6:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				7:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				8:
    					begin
    						glyphRED	 = 12'b111100000000;
    						glyphBLUE	 = 12'b111100000000;
    						glyphGREEN	 = 12'b111100000000;
    					end
    				9:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				10:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				11:
    					begin
    						glyphRED	 = 12'b000000000000;
    						glyphBLUE	 = 12'b000000000000;
    						glyphGREEN	 = 12'b000000000000;
    					end
    				default:
    					begin
    						glyphBLUE	 = 0;
    						glyphRED	 = 0;
    						glyphGREEN	 = 0;
    					end
    			endcase
    		default:
    			begin
    				glyphBLUE	 = 0;
    				glyphRED	 = 0;
    				glyphGREEN	 = 0;
    			end
    	endcase
    end
endmodule
