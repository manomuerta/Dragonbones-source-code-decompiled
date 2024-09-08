package _764
{
   import _708._715;
   import flash.utils.Dictionary;
   
   public class LayoutTemplate
   {
      private static var _5946:Dictionary;
      
      private static var _5945:Class = LayoutTemplate__5945;
      
      public function LayoutTemplate()
      {
         super();
      }
      
      public static function get _5637() : Dictionary
      {
         var _loc1_:XML = null;
         var _loc2_:_715 = null;
         if(!_5946)
         {
            _loc1_ = XML(new _5945());
            _5946 = new Dictionary();
            for each(_loc2_ in _715.List)
            {
               _5946[_loc2_.toString()] = _loc1_[_loc2_.toString()][0].children()[0];
               _5946[_loc2_.toString() + "OpenPanelPosition"] = _5944;
            }
         }
         return _5946;
      }
      
      public static function get _5944() : XML
      {
         return <root/>;
      }
   }
}

