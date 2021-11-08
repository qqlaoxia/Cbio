function [url] = doi2pdf(doi)
%DOI2PDF 此处显示有关此函数的摘要
%   此处显示详细说明
url=['https://sci-hub.ren/',doi];
data=webread(url);
data=split(data,char(10));
data=data(contains(data,'id="pdf"'));
if length(data)>0
    data1=data{1};
    po1=strfind(data1,'http');
    po2=strfind(data1,'.pdf');
    url=data1(po1:po2+3);
else
 url='没有收录';
end
end

