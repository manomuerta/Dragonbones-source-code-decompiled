package _1404
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.ui.Mouse;
   import flash.ui.MouseCursorData;
   
   public class _1405
   {
      public static const AUTO:String = "auto";
      
      public static const DESKTOP_RESIZE_NS:String = "appResizeNS";
      
      public static const DESKTOP_RESIZE_EW:String = "appResizeEW";
      
      public static const DESKTOP_RESIZE_NESW:String = "appResizeNESW";
      
      public static const DESKTOP_RESIZE_NWSE:String = "appResizeNWSE";
      
      public static const DESKTOP_CIRCLE:String = "appCircle";
      
      public static const DESKTOP_DISABLE:String = "disable";
      
      public static const DESKTOP_DRAG:String = "drag";
      
      public static const DESKTOP_PICKER:String = "picker";
      
      private static var _9840:Class = _1405__9840;
      
      private static var _9841:Class = _1405__9841;
      
      private static var _9839:Class = _1405__9839;
      
      private static var _9838:Class = _1405__9838;
      
      private static var _9835:Class = _1405__9835;
      
      private static var _9834:Class = _1405__9834;
      
      private static var _9837:Class = _1405__9837;
      
      private static var _9836:Class = _1405__9836;
      
      private static var _9833:Boolean = false;
      
      public function _1405()
      {
         super();
      }
      
      public static function _9558() : void
      {
         var _loc3_:Class = null;
         var _loc4_:Bitmap = null;
         var _loc5_:MouseCursorData = null;
         if(_9833)
         {
            return;
         }
         var _loc1_:Array = [_9841,_9840,_9839,_9838,_9835,_9834,_9837,_9836];
         var _loc2_:Array = [];
         for each(_loc3_ in _loc1_)
         {
            _loc4_ = new _loc3_();
            (_loc5_ = new MouseCursorData()).data = new <BitmapData>[_loc4_.bitmapData];
            _loc2_.push(_loc5_);
         }
         _loc2_[0].hotSpot = new Point(4.5,11.5);
         _loc2_[1].hotSpot = new Point(11.5,4.5);
         _loc2_[2].hotSpot = new Point(8.5,8.5);
         _loc2_[3].hotSpot = new Point(8.5,8.5);
         _loc2_[4].hotSpot = new Point(9,9);
         _loc2_[5].hotSpot = new Point(10,10);
         _loc2_[6].hotSpot = new Point(0,0);
         _loc2_[7].hotSpot = new Point(1,17);
         Mouse.registerCursor(DESKTOP_RESIZE_NS,_loc2_[0]);
         Mouse.registerCursor(DESKTOP_RESIZE_EW,_loc2_[1]);
         Mouse.registerCursor(DESKTOP_RESIZE_NESW,_loc2_[2]);
         Mouse.registerCursor(DESKTOP_RESIZE_NWSE,_loc2_[3]);
         Mouse.registerCursor(DESKTOP_CIRCLE,_loc2_[4]);
         Mouse.registerCursor(DESKTOP_DISABLE,_loc2_[5]);
         Mouse.registerCursor(DESKTOP_DRAG,_loc2_[6]);
         Mouse.registerCursor(DESKTOP_PICKER,_loc2_[7]);
         _9833 = true;
      }
   }
}

