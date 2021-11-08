function [doi] = ter2doi(term)
%TER2DOI 此处显示有关此函数的摘要
%   此处显示详细说明
url1=sprintf('https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=%s',term);
data1=webread(url1);

pattern = "<Count>[0-9]{1,10}</Count>";
res=regexpi(data1,pattern,'match');
res=regexpi(res{1},'[0-9]{1,10}','match');

url2=[url1,'&retmax=',res{1}];
data2=webread(url2);
pattern = "<Id>[0-9]{1,10}</ID>";
data2=regexpi(data2,pattern,'match');
f=@(x)(x(5:end-5));
data3=cellfun(f,data2,'UniformOutput',false);
data3=strjoin(data3,',');


url3=sprintf('https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=%s&retmode=text&rettype=abstract',data3);
data4=webread(url3);
data5=split(data4,char(10));
data5=data5(startsWith(data5,'DOI: '));
f=@(x)(x(6:end));
data5=cellfun(f,data5,'UniformOutput',false);
doi=data5;
end

