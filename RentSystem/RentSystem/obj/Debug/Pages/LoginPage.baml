   M S B A M L   `   `   `  ����E  ARentSystem, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:RentSystem.PagesRentSystem.Pages  5           RentSystem.Pages.LoginPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      0localclr-namespace:RentSystem.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5        N� Title$  	LoginPage��5
      .��5      � .+�5   
   �� $	��400��6   $	��500��5      $��Center=�5       �� Padding$ 85q�5       �� CornerRadius$ 50��5      $��3q�5       J� Opacity$
 0.95Q�5       J� Effect 5      3  -System.Windows.Media.Effects.DropShadowEffect  5         
BlurRadius$ 30Q�6#      Color$ 
BlueViolet��63   ��5      �� 5       �� 
StartPoint$	 0,1&�6&    �� EndPoint$	 1,0&�67   .��5      � 	 � Color$	 #060531��6#   
 � Offset$
 0Q�63   � 5      $	 #1B1448��6#   $

 0.75Q�63   5      ��5      �� 5      $	 0,0&�6&   $	 1,1&�67   .��5      � $	 #462AD8��6#   $
 0Q�63   � 5      $	 #DA34AE��6#   $

 0.75Q�63   � 5       $	 #8A16C1��6#   $
 1Q�63   5!      ._�5$      �� $��-10, 10, -10, 10q�6   .+�5%      �� $��Авторизация��6   
�������$��28(�5'      $
��Bold"�5(      $��Center=�5)      $��10, 0, 15, 40q�5*      '  !MaterialDesignThemes.Wpf.PackIcon  5+         Kind$ HumanGreetingVariant=�6*   $��55, -60, 0, 0q�6F   
�������5,   *   � 5-      $��0, 0, 0, 20q�6    � ColumnDefinitions 5.      �� 5/      $	��11* �6+   �� 50      $	��56* �6+   .+�52      �� -   5         ��Name$ BRegistration��52      
�������
����h{�$��Регистрация��55      $��1��56   9   $��	166,0,8,0q�6I   �� 58      -   5        $ BEnter��58       �� 	IsDefault . 
�������
����h{�$
��Left=�5<      $	��100��5=      $��
Войти��5>      $��1��5?   2   $��-55, 0, 0, 0q�6B   5@      �� 5A      -   5         ��Name$ TBLogin��5A      $��0, 0, 0, 10q�6+   
�������)  #MaterialDesignThemes.Wpf.HintAssist   Hint$B <Введите логин или номер телефона��5C         
IsFloating .  %  !MaterialDesignFloatingHintTextBox#��[  5E      �� 5F      .+�5G      G� -   5         G�Name$ 
TBPassword��5H      
�������$! Введите пароль��5J      .  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton .  / +MaterialDesignFloatingHintRevealPasswordBox#��[ 5M      0  *MaterialDesignThemes.Wpf.PasswordBoxAssist   Password 5K      �� *	Password2+ �� Mode$ TwoWay=�5M      5O      5P      5Q      5R      5S      