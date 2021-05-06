figure(1), hold on
plot(nodeArch.nodesLoc(:, 1), nodeArch.nodesLoc(:, 2),...
    '.', 'MarkerSize',15);
plot(netArch.Sink.x, netArch.Sink.y,'o', ...
    'MarkerSize',8, 'MarkerFaceColor', 'g');
title('Sensor Nodes and Base Station Deployment With in The Network ')
xlabel('Network Length')
ylabel('Network Width')
axis square