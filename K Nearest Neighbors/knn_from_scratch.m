function targets = knn_from_scratch(train_data,train_target,k,test_data)
    % This function returns predictions based on the Euclidean distance
    % of the input data with respect to all training data.
    % It first sorts the distances and then chooses the target that has the
    % most occurrences among the first k sorted data points.


    train_targets = categorical(train_target);
    predict_target = categorical(1,size(test_data,1));

    for i = 1:size(test_data,1)
        distances = sqrt(sum((train_data-test_data(i,:)).^2,2));
        [~,sorted_indices] = sort(distances);
        knn_matrix = train_targets(sorted_indices(1:k));
        predict_target(i) = mode(knn_matrix);

    end

    targets = predict_target;
end


