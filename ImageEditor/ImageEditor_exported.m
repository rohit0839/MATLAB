classdef ImageEditor_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        UIAxes                 matlab.ui.control.UIAxes
        LoadCustomImageButton  matlab.ui.control.Button
        GrayButton             matlab.ui.control.Button
        BWButton               matlab.ui.control.Button
        ResetButton            matlab.ui.control.Button
        BrightnessSliderLabel  matlab.ui.control.Label
        BrightnessSlider       matlab.ui.control.Slider
        ContrastSliderLabel    matlab.ui.control.Label
        ContrastSlider         matlab.ui.control.Slider
        SharpenButton          matlab.ui.control.Button
        EdgeDetectButton       matlab.ui.control.Button
        ComplementButton       matlab.ui.control.Button
        RedButton              matlab.ui.control.Button
        GreenButton            matlab.ui.control.Button
        BlueButton             matlab.ui.control.Button
        ImageEditorLabel       matlab.ui.control.Label
    end

    methods (Access = private)

        % Button pushed function: LoadCustomImageButton
        function LoadCustomImageButtonPushed(app, event)
            global image
            [FileName, FilePath] = uigetfile({'*.jpg;*.png;*.jpeg;*.gif;*.tif'},'Select a File');
            FullPath = fullfile(FilePath, FileName);
            if isnumeric(FileName) 
                return; 
            end
            image = imread(FullPath);
            imshow(image,'Parent',app.UIAxes);
        end

        % Button pushed function: GrayButton
        function GrayButtonPushed(app, event)
            global image
            imshow(rgb2gray(image),'Parent',app.UIAxes);
        end

        % Button pushed function: BWButton
        function BWButtonPushed(app, event)
            global image
            imshow(im2bw(image),'Parent',app.UIAxes);
        end

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
            global image
            imshow(image,'Parent',app.UIAxes);
            app.BrightnessSlider.Value = 0;
            app.ContrastSlider.Value = 1;
        end

        % Value changed function: BrightnessSlider
        function BrightnessSliderValueChanged(app, event)
            value_br = app.BrightnessSlider.Value;
            global image
            br_image = image + value_br;
            imagesc(app.UIAxes,br_image);
            %imshow(br_image,'Parent',app.UIAxes);
        end

        % Value changed function: ContrastSlider
        function ContrastSliderValueChanged(app, event)
            value_ct = app.ContrastSlider.Value;
            global image
            ct_image = image.*value_ct;
            imagesc(app.UIAxes,ct_image);
            %imshow(ct_image,'Parent',app.UIAxes);
        end

        % Button pushed function: SharpenButton
        function SharpenButtonPushed(app, event)
            global image
            imshow(imsharpen(image),'Parent',app.UIAxes);
        end

        % Button pushed function: EdgeDetectButton
        function EdgeDetectButtonPushed(app, event)
            global image
            imshow(edge(rgb2gray(image),'Canny'),'Parent',app.UIAxes);
        end

        % Button pushed function: ComplementButton
        function ComplementButtonPushed(app, event)
            global image
            imshow(imcomplement(image),'Parent',app.UIAxes);
        end

        % Button pushed function: RedButton
        function RedButtonPushed(app, event)
            global image
            im_red = image;
            im_red(:,:,2) = 0; 
            im_red(:,:,3) = 0;
            imshow(im_red,'Parent',app.UIAxes);
        end

        % Button pushed function: GreenButton
        function GreenButtonPushed(app, event)
            global image
            im_green = image;
            im_green(:,:,1) = 0; 
            im_green(:,:,3) = 0;
            imshow(im_green,'Parent',app.UIAxes);
        end

        % Button pushed function: BlueButton
        function BlueButtonPushed(app, event)
            global image
            im_blue = image;
            im_blue(:,:,1) = 0; 
            im_blue(:,:,2) = 0;
            imshow(im_blue,'Parent',app.UIAxes);
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            app.UIAxes.Box = 'on';
            app.UIAxes.XTick = [];
            app.UIAxes.YTick = [];
            app.UIAxes.Position = [16 108 440 320];

            % Create LoadCustomImageButton
            app.LoadCustomImageButton = uibutton(app.UIFigure, 'push');
            app.LoadCustomImageButton.ButtonPushedFcn = createCallbackFcn(app, @LoadCustomImageButtonPushed, true);
            app.LoadCustomImageButton.Position = [16 59 320 22];
            app.LoadCustomImageButton.Text = 'Load Custom Image';

            % Create GrayButton
            app.GrayButton = uibutton(app.UIFigure, 'push');
            app.GrayButton.ButtonPushedFcn = createCallbackFcn(app, @GrayButtonPushed, true);
            app.GrayButton.Position = [500 59 100 22];
            app.GrayButton.Text = 'Gray';

            % Create BWButton
            app.BWButton = uibutton(app.UIFigure, 'push');
            app.BWButton.ButtonPushedFcn = createCallbackFcn(app, @BWButtonPushed, true);
            app.BWButton.Position = [500 100 100 22];
            app.BWButton.Text = 'B/W';

            % Create ResetButton
            app.ResetButton = uibutton(app.UIFigure, 'push');
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);
            app.ResetButton.Position = [356 59 100 22];
            app.ResetButton.Text = 'Reset';

            % Create BrightnessSliderLabel
            app.BrightnessSliderLabel = uilabel(app.UIFigure);
            app.BrightnessSliderLabel.HorizontalAlignment = 'right';
            app.BrightnessSliderLabel.Position = [478 231 64 22];
            app.BrightnessSliderLabel.Text = 'Brightness';

            % Create BrightnessSlider
            app.BrightnessSlider = uislider(app.UIFigure);
            app.BrightnessSlider.Limits = [-100 100];
            app.BrightnessSlider.MajorTicks = [-100 -75 -50 -25 0 25 50 75 100];
            app.BrightnessSlider.MajorTickLabels = {'-100', '-75', '-50', '-25', '0', '25', '50', '75', '100'};
            app.BrightnessSlider.Orientation = 'vertical';
            app.BrightnessSlider.ValueChangedFcn = createCallbackFcn(app, @BrightnessSliderValueChanged, true);
            app.BrightnessSlider.Position = [486 261 3 150];

            % Create ContrastSliderLabel
            app.ContrastSliderLabel = uilabel(app.UIFigure);
            app.ContrastSliderLabel.HorizontalAlignment = 'right';
            app.ContrastSliderLabel.Position = [565 231 56 22];
            app.ContrastSliderLabel.Text = 'Contrast';

            % Create ContrastSlider
            app.ContrastSlider = uislider(app.UIFigure);
            app.ContrastSlider.Limits = [1 10];
            app.ContrastSlider.MajorTicks = [1 2 3 4 5 6 7 8 9 10];
            app.ContrastSlider.Orientation = 'vertical';
            app.ContrastSlider.ValueChangedFcn = createCallbackFcn(app, @ContrastSliderValueChanged, true);
            app.ContrastSlider.Position = [576 261 3 150];
            app.ContrastSlider.Value = 1;

            % Create SharpenButton
            app.SharpenButton = uibutton(app.UIFigure, 'push');
            app.SharpenButton.ButtonPushedFcn = createCallbackFcn(app, @SharpenButtonPushed, true);
            app.SharpenButton.Position = [500 18 100 22];
            app.SharpenButton.Text = 'Sharpen';

            % Create EdgeDetectButton
            app.EdgeDetectButton = uibutton(app.UIFigure, 'push');
            app.EdgeDetectButton.ButtonPushedFcn = createCallbackFcn(app, @EdgeDetectButtonPushed, true);
            app.EdgeDetectButton.Position = [500 141 100 22];
            app.EdgeDetectButton.Text = 'Edge Detect';

            % Create ComplementButton
            app.ComplementButton = uibutton(app.UIFigure, 'push');
            app.ComplementButton.ButtonPushedFcn = createCallbackFcn(app, @ComplementButtonPushed, true);
            app.ComplementButton.Position = [500 182 100 22];
            app.ComplementButton.Text = 'Complement';

            % Create RedButton
            app.RedButton = uibutton(app.UIFigure, 'push');
            app.RedButton.ButtonPushedFcn = createCallbackFcn(app, @RedButtonPushed, true);
            app.RedButton.Position = [16 18 100 22];
            app.RedButton.Text = 'Red';

            % Create GreenButton
            app.GreenButton = uibutton(app.UIFigure, 'push');
            app.GreenButton.ButtonPushedFcn = createCallbackFcn(app, @GreenButtonPushed, true);
            app.GreenButton.Position = [186 18 100 22];
            app.GreenButton.Text = 'Green';

            % Create BlueButton
            app.BlueButton = uibutton(app.UIFigure, 'push');
            app.BlueButton.ButtonPushedFcn = createCallbackFcn(app, @BlueButtonPushed, true);
            app.BlueButton.Position = [356 18 100 22];
            app.BlueButton.Text = 'Blue';

            % Create ImageEditorLabel
            app.ImageEditorLabel = uilabel(app.UIFigure);
            app.ImageEditorLabel.FontSize = 14;
            app.ImageEditorLabel.Position = [284 441 85 22];
            app.ImageEditorLabel.Text = 'Image Editor';
        end
    end

    methods (Access = public)

        % Construct app
        function app = ImageEditor_exported

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end