classdef Calculator_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        abacus          matlab.ui.Figure
        four            matlab.ui.control.Button
        seven           matlab.ui.control.Button
        clear           matlab.ui.control.Button
        two             matlab.ui.control.Button
        five            matlab.ui.control.Button
        eight           matlab.ui.control.Button
        zero            matlab.ui.control.Button
        three           matlab.ui.control.Button
        six             matlab.ui.control.Button
        nine            matlab.ui.control.Button
        equal           matlab.ui.control.Button
        subtraction     matlab.ui.control.Button
        multiplication  matlab.ui.control.Button
        divide          matlab.ui.control.Button
        addition        matlab.ui.control.Button
        EditField       matlab.ui.control.EditField
        one             matlab.ui.control.Button
        info            matlab.ui.control.Button
    end
  

    methods (Access = private)

        % Button pushed function: one
        function oneButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('1');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: two
        function twoButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('2');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: three
        function threeButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('3');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: four
        function fourButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('4');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: five
        function fiveButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('5');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: six
        function sixButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('6');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: seven
        function sevenButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('7');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: eight
        function eightButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('8');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: nine
        function nineButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('9');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: zero
        function zeroButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('0');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: divide
        function divideButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('/');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: multiplication
        function multiplicationButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('*');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: subtraction
        function subtractionButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('-');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: addition
        function additionButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            newString = ('+');
            textString = strcat(ExistingString,newString);
            app.EditField.Value = textString;
        end

        % Button pushed function: clear
        function clearButtonPushed(app, event)
            app.EditField.Value = ('');
        end

        % Button pushed function: equal
        function equalButtonPushed(app, event)
            ExistingString = app.EditField.Value;
            try
                result = eval(ExistingString);
                app.EditField.Value = num2str(result);
            catch
                app.EditField.Value = ('Error!');
            end
        end

        % Button pushed function: info
        function infoPushed(app, event)
            message = sprintf('Developed by :\n Rohit Ranjan');
            uialert(app.abacus,message,'Info','Icon','success');
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create abacus
            app.abacus = uifigure;
            app.abacus.AutoResizeChildren = 'off';
            app.abacus.Position = [100 100 408 428];
            app.abacus.Name = 'Calculator';
            app.abacus.Resize = 'off';

            % Create one
            app.one = uibutton(app.abacus, 'push');
            app.one.ButtonPushedFcn = createCallbackFcn(app, @oneButtonPushed, true);
            app.one.FontSize = 14;
            app.one.FontWeight = 'bold';
            app.one.Position = [98 137 46 44];
            app.one.Text = '1';

            % Create four
            app.four = uibutton(app.abacus, 'push');
            app.four.ButtonPushedFcn = createCallbackFcn(app, @fourButtonPushed, true);
            app.four.FontSize = 14;
            app.four.FontWeight = 'bold';
            app.four.Position = [98 191 46 44];
            app.four.Text = '4';

            % Create seven
            app.seven = uibutton(app.abacus, 'push');
            app.seven.ButtonPushedFcn = createCallbackFcn(app, @sevenButtonPushed, true);
            app.seven.FontSize = 14;
            app.seven.FontWeight = 'bold';
            app.seven.Position = [98 245 46 44];
            app.seven.Text = '7';

            % Create clear
            app.clear = uibutton(app.abacus, 'push');
            app.clear.ButtonPushedFcn = createCallbackFcn(app, @clearButtonPushed, true);
            app.clear.FontSize = 14;
            app.clear.FontWeight = 'bold';
            app.clear.Position = [98 83 46 44];
            app.clear.Text = 'C';

            % Create two
            app.two = uibutton(app.abacus, 'push');
            app.two.ButtonPushedFcn = createCallbackFcn(app, @twoButtonPushed, true);
            app.two.FontSize = 14;
            app.two.FontWeight = 'bold';
            app.two.Position = [154 137 46 44];
            app.two.Text = '2';

            % Create five
            app.five = uibutton(app.abacus, 'push');
            app.five.ButtonPushedFcn = createCallbackFcn(app, @fiveButtonPushed, true);
            app.five.FontSize = 14;
            app.five.FontWeight = 'bold';
            app.five.Position = [154 191 46 44];
            app.five.Text = '5';

            % Create eight
            app.eight = uibutton(app.abacus, 'push');
            app.eight.ButtonPushedFcn = createCallbackFcn(app, @eightButtonPushed, true);
            app.eight.FontSize = 14;
            app.eight.FontWeight = 'bold';
            app.eight.Position = [154 245 46 44];
            app.eight.Text = '8';

            % Create zero
            app.zero = uibutton(app.abacus, 'push');
            app.zero.ButtonPushedFcn = createCallbackFcn(app, @zeroButtonPushed, true);
            app.zero.FontSize = 14;
            app.zero.FontWeight = 'bold';
            app.zero.Position = [154 83 46 44];
            app.zero.Text = '0';

            % Create three
            app.three = uibutton(app.abacus, 'push');
            app.three.ButtonPushedFcn = createCallbackFcn(app, @threeButtonPushed, true);
            app.three.FontSize = 14;
            app.three.FontWeight = 'bold';
            app.three.Position = [210 136 46 44];
            app.three.Text = '3';

            % Create six
            app.six = uibutton(app.abacus, 'push');
            app.six.ButtonPushedFcn = createCallbackFcn(app, @sixButtonPushed, true);
            app.six.FontSize = 14;
            app.six.FontWeight = 'bold';
            app.six.Position = [210 191 46 44];
            app.six.Text = '6';

            % Create nine
            app.nine = uibutton(app.abacus, 'push');
            app.nine.ButtonPushedFcn = createCallbackFcn(app, @nineButtonPushed, true);
            app.nine.FontSize = 14;
            app.nine.FontWeight = 'bold';
            app.nine.Position = [210 245 46 44];
            app.nine.Text = '9';

            % Create equal
            app.equal = uibutton(app.abacus, 'push');
            app.equal.ButtonPushedFcn = createCallbackFcn(app, @equalButtonPushed, true);
            app.equal.FontSize = 14;
            app.equal.FontWeight = 'bold';
            app.equal.Position = [210 82 46 44];
            app.equal.Text = '=';

            % Create subtraction
            app.subtraction = uibutton(app.abacus, 'push');
            app.subtraction.ButtonPushedFcn = createCallbackFcn(app, @subtractionButtonPushed, true);
            app.subtraction.FontSize = 14;
            app.subtraction.FontWeight = 'bold';
            app.subtraction.Position = [266 135 46 44];
            app.subtraction.Text = '-';

            % Create multiplication
            app.multiplication = uibutton(app.abacus, 'push');
            app.multiplication.ButtonPushedFcn = createCallbackFcn(app, @multiplicationButtonPushed, true);
            app.multiplication.FontSize = 14;
            app.multiplication.FontWeight = 'bold';
            app.multiplication.Position = [266 190 46 44];
            app.multiplication.Text = '*';

            % Create divide
            app.divide = uibutton(app.abacus, 'push');
            app.divide.ButtonPushedFcn = createCallbackFcn(app, @divideButtonPushed, true);
            app.divide.FontSize = 14;
            app.divide.FontWeight = 'bold';
            app.divide.Position = [266 245 46 44];
            app.divide.Text = '/';

            % Create addition
            app.addition = uibutton(app.abacus, 'push');
            app.addition.ButtonPushedFcn = createCallbackFcn(app, @additionButtonPushed, true);
            app.addition.FontSize = 14;
            app.addition.FontWeight = 'bold';
            app.addition.Position = [266 81 46 44];
            app.addition.Text = '+';

            % Create EditField
            app.EditField = uieditfield(app.abacus, 'text');
            app.EditField.Editable = 'off';
            app.EditField.HorizontalAlignment = 'right';
            app.EditField.Position = [98 310 214 38];

            % Create info
            app.info = uibutton(app.abacus, 'push');
            app.info.ButtonPushedFcn = createCallbackFcn(app, @infoPushed, true);
            app.info.BackgroundColor = [0.9412 0.9412 0.9412];
            app.info.FontColor = [0.502 0.502 0.502];
            app.info.Position = [376 11 21 22];
            app.info.Text = '©';
        end
    end

    methods (Access = public)

        % Construct app
        function app = Calculator_exported

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.abacus)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.abacus)
        end
    end
end
