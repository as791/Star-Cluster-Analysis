function [out1,out2]=vectorreadjust(x,y)
[x2,ind1]=outliersremoval(x);
[y2,ind2]=outliersremoval(y);
if length(x2)>length(y2)
    temp=zeros(length(x2)-length(ind2),1);
    l=1;k=1;
    for i=1:length(x2)
        if ((l<=length(ind2)) && (i==ind2(l)))
             l=l+1;
        else
           temp(k)=x2(i);
           k=k+1;
        end
    end
    out2=y2;out1=temp;
elseif length(x2)<length(y2)
    temp=zeros(length(y2)-length(ind1),1);
    l=1;k=1;
    for i=1:length(y2)
        if ((l<=length(ind1)) && (i==ind1(l)))
             l=l+1;
        else
           temp(k)=y2(i);
           k=k+1;
        end
    end
    out1=x2;out2=temp;
else
    out1=x2;out2=y2;
end
     
    
