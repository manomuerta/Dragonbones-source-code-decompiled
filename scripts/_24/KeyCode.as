package _24
{
   import flash.utils.Dictionary;
   
   public class KeyCode
   {
      private static var _1668:Dictionary;
      
      public function KeyCode()
      {
         super();
      }
      
      public static function _1667(param1:uint) : String
      {
         if(!_1668)
         {
            _1666();
         }
         if(_1668[param1])
         {
            return _1668[param1];
         }
         return "无";
      }
      
      private static function _1666() : void
      {
         _1668 = new Dictionary();
         _1668[8] = "BackSpace";
         _1668[9] = "Tab";
         _1668[12] = "Clear";
         _1668[13] = "Enter";
         _1668[15] = "Command";
         _1668[16] = "Shift";
         _1668[17] = "Ctrl";
         _1668[18] = "Alt";
         _1668[20] = "CapsLock";
         _1668[27] = "Esc";
         _1668[32] = "Space";
         _1668[33] = "PageUp";
         _1668[34] = "PageDown";
         _1668[35] = "End";
         _1668[36] = "Home";
         _1668[37] = "←";
         _1668[38] = "↑";
         _1668[39] = "→";
         _1668[40] = "↓";
         _1668[45] = "Insert";
         _1668[46] = "Delete";
         _1668[47] = "Help";
         _1668[144] = "NumLock";
         _1668[186] = ";";
         _1668[187] = "=";
         _1668[188] = ",";
         _1668[189] = "-";
         _1668[190] = ".";
         _1668[191] = "/";
         _1668[192] = "\'";
         _1668[219] = "[";
         _1668[220] = "\\";
         _1668[221] = "]";
         _1668[222] = "\'";
         var _loc1_:int = 48;
         while(_loc1_ <= 57)
         {
            _1668[_loc1_] = "" + (_loc1_ - 48);
            _loc1_++;
         }
         _loc1_ = 65;
         while(_loc1_ <= 90)
         {
            _1668[_loc1_] = String.fromCharCode(_loc1_ + 32).toLocaleUpperCase();
            _loc1_++;
         }
         _loc1_ = 96;
         while(_loc1_ <= 105)
         {
            _1668[_loc1_] = "Numpad_" + (_loc1_ - 96);
            _loc1_++;
         }
         _loc1_ = 112;
         while(_loc1_ <= 126)
         {
            _1668[_loc1_] = "F" + (_loc1_ - 111);
            _loc1_++;
         }
      }
   }
}

