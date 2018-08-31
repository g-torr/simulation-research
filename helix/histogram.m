skip_lines=13;
skip_columns=0;
file='histo.xvg';
h = dlmread(file, '', skip_lines, skip_columns);
figure();
hold on

N=21;
for ii=2:N
    h(:,ii)=h(:,ii)/sum(h(:,ii));% normalise the frequency 
    plot(h(:,1),h(:,ii),'-');
end
hold off;
xlim([0 4.3]);
xlabel('Reaction coordinates (nm)');
ylabel('Frequency');
%title('Umbrella histrograms for hairpin protein');
tightfig()
print(gcf,'histo.png','-dpng','-r300');  




figure()
hold on
for ii=3:N %1 consecutive histogram overlap 
    m(:,ii)=min(h(:,ii-1),h(:,ii));
    plot(h(:,1),m(:,ii));
end
hold off;
xlim([0 4.3]);
xlabel('Reaction coordinates (nm)');
ylabel('Overlap');
tightfig()
print(gcf,'histo-2.png','-dpng','-r300');  

figure()
hold on
for ii=4:N %2 consecutive histogram overlap
    m(:,ii)=h(:,ii-2).*h(:,ii-1).*h(:,ii);
    plot(h(:,1),m(:,ii));
end
hold off;
xlim([0 4.3]);
xlabel('Reaction coordinates (nm)');
ylabel('Overlap');
tightfig()
print(gcf,'histo-3.png','-dpng','-r300');  

figure()
hold on
for ii=5:N
    m(:,ii)=h(:,ii-3).*h(:,ii-2).*h(:,ii-1).*h(:,ii);
    plot(h(:,1),m(:,ii));
end
hold off;
xlim([0 4.3]);
xlabel('Reaction coordinates (nm)');
ylabel('Overlap');
tightfig()
print(gcf,'histo-4.png','-dpng','-r300');  

clear m;
m=h(:,2);
for ii=3:N
    m=m+h(:,ii)
end
figure()
plot(h(:,1),m/N)
hold off;
xlim([0 4.3]);
xlabel('Reaction coordinates (nm)');
ylabel('Frequency');
tightfig()
print(gcf,'histo-sum.png','-dpng','-r300');  
