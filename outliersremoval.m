function [out1,out2]=outliersremoval(x)
max_value_x=max(x);
min_value_x=min(x);
median_x=median(x);
qs=prctile(x,[25 75]);
iqr=qs(2)-qs(1);
uplim=qs(2) + (1.5*iqr);
lowlim=qs(1)-(1.5*iqr);
k=uplim+4;
s=0;
for i=1:length(x)
    if ((x(i)>=lowlim) && (x(i)<=uplim))
        continue;
    else
        s=s+1;
    end
end
newx=zeros(length(x)-s,1);removindices=zeros(s,1);
l=1;m=1;
for i=1:length(x)
    if ((x(i)>=lowlim) && (x(i)<=uplim))
        newx(l)=x(i);
        l=l+1;
    else
        removindices(m)=i;
        m=m+1;
    end
end
out1=newx;
out2=removindices;
