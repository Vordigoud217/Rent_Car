   M S B A M L   `   `   `  ����E  ARentSystem, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:RentSystem.PagesRentSystem.Pages  5      !    RentSystem.Pages.BasketPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      0localclr-namespace:RentSystem.Pages     5      -   5          N�Name$  PBasketPage��5
       N� Title$ 
BasketPage��5	       N� 
Background
 ���� .��5      ��  �� CornerRadius$ 	0 15 0 15��6   ._�5   
   �  � RowDefinitions 5      �� 5      $��35 �6    �� 5      $��1* �6     � ColumnDefinitions 5      �� 5      $��70 �6#   �� 5      $��3* �6#   �� 5      $��1* �6#   .+�5       � -   5          �Name$ 	CarBasket��5        � NavigationUIVisibility$ Hidden=�6'   $��1��5      $��1��5      �� 5      $��2��6   $��1��5      $��1��5      .+�5      �� $,��&Выбор метода платежа��6   $��5q�67   $��16(�6B   $��Center=�6P   �� 5       -   5         ��Name$ CbPaymentMethod��5       $
��auto��64   $��5q�5!      5#      5$      �� 5&      -   5        	 ��Name$	 LvBasket��5'      $��Disabled=�5(      $��-20 -60 0 0q�5)      ��5*      �� 5+      .R�5,      � 
 � Orientation$
 
Horizontal=�6$   $��Stretch=�5-      $	��Top=�5.      $��5q�5/      50      51      ��53      �� 54      .R�55      �� ���#1B1448$��2q�56      $ 15��57       �� Padding$ 5q�58      $��0 0 0 0q�59      $	��280��5:      $	��310��5;      ._�5<      �� .+�5=   "   �� .+�5>   &   �� $ 30��6-   ._�5?   *   ��  ��Name$ 	ImageMenu��60   $	��265��6`   $	��150��6l    �� BitmapScalingMode$
 Fant=�6y   ��6C   �� *
ImageCar+5A   +   5B   '   �� 5C   &   .+�5D   *   �� $��0 15 0 0q�6d   $��
ExtraBlack"�6v   
���   ���64   �� *
CarModel+ �� StringFormat$	 {0}��6�   �� 5E   *   $
��Bold"�6d   ��64   �� *
CarBrand+$	 {0}��6d   �� 5F   *   $
��Bold"�6b   ��64   �� *Engine+$	 {0}��6b   �� 5G   *   $
��Bold"�6h   ��64   �� *Transmission+$	 {0}��6h   �� 5H   *   $
��Bold"�6e   ��64   �� *	DriveUnit+$	 {0}��6e   5I   '   5J   #   5K      5L      5M      5O      5P      5Q      5R      