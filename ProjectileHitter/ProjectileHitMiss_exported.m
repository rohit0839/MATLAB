classdef ProjectileHitMiss_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        HitMissUIFigure         matlab.ui.Figure
        UIAxes                  matlab.ui.control.UIAxes
        FIREButton              matlab.ui.control.Button
        VelocityEditFieldLabel  matlab.ui.control.Label
        VelocityEditField       matlab.ui.control.NumericEditField
        AngleEditFieldLabel     matlab.ui.control.Label
        AngleEditField          matlab.ui.control.NumericEditField
        Label                   matlab.ui.control.Label
    end

    
    properties (Access = public)
        target;     % object to be hit
    end
  

    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.UIAxes.XLim = [0 200];
            app.UIAxes.YLim = [0 100];
            app.target = 100*rand + 25;
            plot(app.UIAxes,app.target,0,'h','MarkerSize',10,'LineWidth',1.5,'Color','red');
            hold(app.UIAxes);
        end

        % Button pushed function: FIREButton
        function FIREButtonPushed(app, event)
            velocity = app.VelocityEditField.Value;
            angle = app.AngleEditField.Value;
            t = 0:0.1:100;
            sx = velocity*cosd(angle)*t;    % g=0
            sy = velocity*sind(angle)*t + 0.5*(-9.8)*t.^2;
            val = find(sy>=0);
            posx = sx(val);
            posy = sy(val);
            comet(app.UIAxes,posx,posy);
            finalx = max(posx);
            if abs(finalx - app.target) <= 5
                app.Label.Text = 'HIT!';
                startagain = menu('Want to play again?','Yes','No');
                if startagain == 1
                    app.delete;
                    ProjectileHitMiss;
                else
                    delete(app);
                end
            elseif abs(finalx - app.target) <=20
                app.Label.Text = 'CLOSE!';
            else
                app.Label.Text = 'TRY AGAIN!';
            end
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create HitMissUIFigure
            app.HitMissUIFigure = uifigure;
            app.HitMissUIFigure.Position = [100 100 606 431];
            app.HitMissUIFigure.Name = 'Hit&Miss';

            % Create UIAxes
            app.UIAxes = uiaxes(app.HitMissUIFigure);
            title(app.UIAxes, 'PROJECTILE')
            xlabel(app.UIAxes, 'DISTANCE')
            ylabel(app.UIAxes, 'HEIGHT')
            app.UIAxes.GridColor = [0 0 0];
            app.UIAxes.GridAlpha = 0.5;
            app.UIAxes.MinorGridAlpha = 0.3;
            app.UIAxes.Box = 'on';
            app.UIAxes.XGrid = 'on';
            app.UIAxes.XMinorGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.YMinorGrid = 'on';
            app.UIAxes.Position = [72 133 464 271];

            % Create FIREButton
            app.FIREButton = uibutton(app.HitMissUIFigure, 'push');
            app.FIREButton.ButtonPushedFcn = createCallbackFcn(app, @FIREButtonPushed, true);
            app.FIREButton.FontSize = 22;
            app.FIREButton.FontWeight = 'bold';
            app.FIREButton.Position = [367 32 138 56];
            app.FIREButton.Text = 'FIRE';

            % Create VelocityEditFieldLabel
            app.VelocityEditFieldLabel = uilabel(app.HitMissUIFigure);
            app.VelocityEditFieldLabel.HorizontalAlignment = 'right';
            app.VelocityEditFieldLabel.Position = [129 66 47 22];
            app.VelocityEditFieldLabel.Text = 'Velocity';

            % Create VelocityEditField
            app.VelocityEditField = uieditfield(app.HitMissUIFigure, 'numeric');
            app.VelocityEditField.Position = [191 66 100 22];

            % Create AngleEditFieldLabel
            app.AngleEditFieldLabel = uilabel(app.HitMissUIFigure);
            app.AngleEditFieldLabel.HorizontalAlignment = 'right';
            app.AngleEditFieldLabel.Position = [140 32 36 22];
            app.AngleEditFieldLabel.Text = 'Angle';

            % Create AngleEditField
            app.AngleEditField = uieditfield(app.HitMissUIFigure, 'numeric');
            app.AngleEditField.Position = [191 32 100 22];

            % Create Label
            app.Label = uilabel(app.HitMissUIFigure);
            app.Label.FontWeight = 'bold';
            app.Label.Position = [291 102 77 22];
            app.Label.Text = '';
        end
    end

    methods (Access = public)

        % Construct app
        function app = ProjectileHitMiss_exported

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.HitMissUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.HitMissUIFigure)
        end
    end
end