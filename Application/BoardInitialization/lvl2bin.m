function lvl2bin(filename)
%

MAPWIDTH = 28;
MAPHEIGHT = 31;

PILL    =   271;
BLANK   =   0;
SUPERPILL	 =	300;
WALL_CORNER1	 =	801;
WALL_CORNER2	 =	802;
WALL_CORNER3	 =	803;
WALL_CORNER4	 =	804;
WALL_INV_CORNER1	 =	805;
WALL_INV_CORNER2	 =	806;
WALL_INV_CORNER3	 =	807;
WALL_INV_CORNER4	 =	808;
WALL_SIDE1	 =	809;
WALL_SIDE2	 =	810;
WALL_SIDE3	 =	811;
WALL_SIDE4	 =	812;

[~,name] = fileparts(strcat('/',filename));
RGB_img = imread(['BMP\' filename]);

[fileheight,filewidth,~] = size(RGB_img)

if (filewidth ~= MAPWIDTH || fileheight ~= MAPHEIGHT)
    printf('ERROR BITCHEZ, UR MAP IS WRONG SIZE');
end

fid=fopen(strcat(name,'.bin'),'w'); % make binary file

for l = 0:MAPHEIGHT-1
    for m = 0:MAPWIDTH-1
        i = MAPHEIGHT-l;
        j = MAPWIDTH-m;
        
        if((RGB_img(i,j,1) == 0) && (RGB_img(i,j,2) == 45) && (RGB_img(i,j,3) == 7))
            fprintf(fid,strcat(dec2bin(WALL_CORNER1,16),'\n'));
       
        elseif((RGB_img(i,j,1) == 9) && (RGB_img(i,j,2) == 0) && (RGB_img(i,j,3) == 94))
            fprintf(fid,strcat(dec2bin(WALL_SIDE1,16),'\n'));
        
        elseif((RGB_img(i,j,1) == 27) && (RGB_img(i,j,2) == 173) && (RGB_img(i,j,3) == 164))
            fprintf(fid,strcat(dec2bin(WALL_CORNER2,16),'\n'));
        
        elseif((RGB_img(i,j,1) == 27) && (RGB_img(i,j,2) == 173) && (RGB_img(i,j,3) == 52))
            fprintf(fid,strcat(dec2bin(WALL_SIDE2,16),'\n'));
        
        elseif((RGB_img(i,j,1) == 149) && (RGB_img(i,j,2) == 64) && (RGB_img(i,j,3) == 52))
            fprintf(fid,strcat(dec2bin(WALL_CORNER3,16),'\n'));
            
        elseif((RGB_img(i,j,1) == 115) && (RGB_img(i,j,2) == 58) && (RGB_img(i,j,3) == 164))
            fprintf(fid,strcat(dec2bin(WALL_SIDE3,16),'\n'));   
            
        elseif((RGB_img(i,j,1) == 206) && (RGB_img(i,j,2) == 173) && (RGB_img(i,j,3) == 52))
            fprintf(fid,strcat(dec2bin(WALL_CORNER4,16),'\n'));
            
        elseif((RGB_img(i,j,1) == 255) && (RGB_img(i,j,2) == 124) && (RGB_img(i,j,3) == 52))
            fprintf(fid,strcat(dec2bin(WALL_SIDE4,16),'\n')); 
            
            
        elseif((RGB_img(i,j,1) == 255) && (RGB_img(i,j,2) == 100) && (RGB_img(i,j,3) == 243))
            fprintf(fid,strcat(dec2bin(WALL_INV_CORNER1,16),'\n')); 
        
        elseif((RGB_img(i,j,1) == 255) && (RGB_img(i,j,2) == 0) && (RGB_img(i,j,3) == 85))
            fprintf(fid,strcat(dec2bin(WALL_INV_CORNER4,16),'\n'));   
            
        elseif((RGB_img(i,j,1) == 73) && (RGB_img(i,j,2) == 255) && (RGB_img(i,j,3) == 152))
            fprintf(fid,strcat(dec2bin(WALL_INV_CORNER2,16),'\n'));   
            
         elseif((RGB_img(i,j,1) == 32) && (RGB_img(i,j,2) == 121) && (RGB_img(i,j,3) == 255))
            fprintf(fid,strcat(dec2bin(WALL_INV_CORNER3,16),'\n'));   
            
            
        elseif((RGB_img(i,j,1) == 255) && (RGB_img(i,j,2) == 255) && (RGB_img(i,j,3) == 255))
            fprintf(fid,strcat(dec2bin(PILL,16),'\n'));
            
        elseif((RGB_img(i,j,1) == 255) && (RGB_img(i,j,2) == 0) && (RGB_img(i,j,3) == 0))
            fprintf(fid,strcat(dec2bin(SUPERPILL,16),'\n'));
        else
            fprintf(fid,strcat(dec2bin(BLANK,16),'\n'));
        end
    end
end


fclose=(fid);
