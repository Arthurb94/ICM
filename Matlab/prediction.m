function [pred] = prediction(model,image)
    pred = 0;
    prediction = classify(model,image);
    if prediciton == 'Gauche'
        pred = 1;
    else 
        pred = 2;
    end
end