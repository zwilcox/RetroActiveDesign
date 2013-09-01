GLYPHSIZE = 12;

fnames = dir('JPEG2\*.jpg');
numFiles = length(fnames);
ROWWIDTH = ceil(log2(GLYPHSIZE));
fid=fopen('glyphGen.v','w' ); % make some glyphs

fprintf(fid,'`timescale 1ns / 1ps\n');
fprintf(fid,'//GENERATED AUTOMATICALLY BY im2glyph\n');
fprintf(fid,'//CS3710 FALL 2012, University of Utah \n');
fprintf(fid,'//Ariosto Ferro, Jeff Thacker, Todd Cronin, Zach Wilcox \n\n\n');
fprintf(fid,'//RETROACTIVE DESIGN\n\n\n\n');
fprintf(fid,'module glyphGen(\n');
fprintf(fid,'    input [15:0] glyphNUM,\n');
fprintf(fid,['    input [' int2str(ROWWIDTH-1) ':0] ROW,\n']);
fprintf(fid,['    output reg [' int2str(GLYPHSIZE-1) ':0] glyphRED,\n']);
fprintf(fid,['    output reg [' int2str(GLYPHSIZE-1) ':0] glyphGREEN,\n']);
fprintf(fid,['    output reg [' int2str(GLYPHSIZE-1) ':0] glyphBLUE\n']);
fprintf(fid,'    );\n\n\n'); 

if (log2(numFiles) > 14) 
    printf('ERROR, MORE THAN 2^14 GLYPHS');
end

for i = 1:numFiles
    [~,name] = fileparts(strcat('/',fnames(i).name));
    fprintf(fid,strcat('    parameter\t',upper(name),'\t =\t',int2str(i-1),';\n'));
end

fprintf(fid,'\n\n    always@(*) begin\n');
fprintf(fid,'    \tglyphRED = 0;\n    \tglyphBLUE = 0;\n    \tglyphRED = 0;\n');
fprintf(fid,'    \tcase(glyphNUM)\n');
		

for i = 1:numFiles
    filename = fnames(i).name;
    RGB_img = imread(['JPEG2\' filename]);
    if ((size(RGB_img,1)~= GLYPHSIZE) || (size(RGB_img,2) ~= GLYPHSIZE))
        fnames(i).name                    %clever error;
        printf('ERROR WRONG IMAGE SIZE.');  %bad syntax fails fast ;)
    end
    
    redBIN = (RGB_img(:,:,1)> 128);
    blueBIN = (RGB_img(:,:,3)> 128);
    greenBIN = (RGB_img(:,:,2) > 128);
    
    [~,name] = fileparts(strcat('/',fnames(i).name));
    
    fprintf(fid,['    \t\t' upper(name) ':\n']);
    fprintf(fid,['    \t\t\tcase(ROW)\n']);
    for i = 1:GLYPHSIZE
        fprintf(fid,['    \t\t\t\t' int2str(i-1) ':\n']);
        fprintf(fid,['    \t\t\t\t\tbegin\n']);
        
        fprintf(fid,['    \t\t\t\t\t\tglyphRED\t = ' int2str(GLYPHSIZE) '''b']);
        for j = 1:GLYPHSIZE
             fprintf(fid,int2str(redBIN(i,j))); 
        end
        fprintf(fid,';\n');
        
        fprintf(fid,['    \t\t\t\t\t\tglyphBLUE\t = ' int2str(GLYPHSIZE) '''b']);
        for j = 1:GLYPHSIZE
             fprintf(fid,int2str(blueBIN(i,j))); 
        end
        fprintf(fid,';\n');
        
        fprintf(fid,['    \t\t\t\t\t\tglyphGREEN\t = ' int2str(GLYPHSIZE) '''b']);
        for j = 1:GLYPHSIZE
             fprintf(fid,int2str(greenBIN(i,j))); 
        end
        fprintf(fid,';\n');
        fprintf(fid,['    \t\t\t\t\tend\n']);
        
    end
    fprintf(fid,['    \t\t\t\tdefault:\n']);
    fprintf(fid,['    \t\t\t\t\tbegin\n']);
    fprintf(fid,['    \t\t\t\t\t\tglyphBLUE\t = 0;\n']);
    fprintf(fid,['    \t\t\t\t\t\tglyphRED\t = 0;\n']);
    fprintf(fid,['    \t\t\t\t\t\tglyphGREEN\t = 0;\n']);
    fprintf(fid,['    \t\t\t\t\tend\n']);
    fprintf(fid,['    \t\t\tendcase\n']);
end
fprintf(fid,['    \t\tdefault:\n']);
fprintf(fid,['    \t\t\tbegin\n']);
fprintf(fid,['    \t\t\t\tglyphBLUE\t = 0;\n']);
fprintf(fid,['    \t\t\t\tglyphRED\t = 0;\n']);
fprintf(fid,['    \t\t\t\tglyphGREEN\t = 0;\n']);
fprintf(fid,['    \t\t\tend\n']);
fprintf(fid,['    \tendcase\n']);
fprintf(fid,['    end\n']);
fprintf(fid,['endmodule\n']);
fclose=(fid);
