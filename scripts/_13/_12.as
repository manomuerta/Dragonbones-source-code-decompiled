package _13
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.ui.Mouse;
   import flash.ui.MouseCursorData;
   
   public class _12
   {
      public static const AUTO:String = "auto";
      
      public static const CURSOR_DRAG_HAND_FORKEY:String = "CURSOR_DRAG_HAND_FORKEY";
      
      public static const CURSOR_DRAG_HAND_FORTOOL:String = "CURSOR_DRAG_HAND_FORTOOL";
      
      private static var _1599:Class = _12__1599;
      
      public static const CURSOR_CREATE_BONE:String = "CURSOR_CREATE_BONE";
      
      private static var _1597:Class = _12__1597;
      
      public static const CURSOR_APPEND_SLOT:String = "CURSOR_APPEND_SLOT";
      
      private static var _1596:Class = _12__1596;
      
      public static const CURSOR_ZOOM_IN:String = "cursorZoomIn";
      
      private static var _1591:Class = _12__1591;
      
      public static const CURSOR_ZOOM_OUT:String = "cursorZoomOut";
      
      private static var _1590:Class = _12__1590;
      
      public static const CURSOR_MOVE:String = "CURSOR_MOVE";
      
      private static var _1598:Class = _12__1598;
      
      public static const CURSOR_ROTATE:String = "CURSOR_ROTATE";
      
      private static var _1592:Class = _12__1592;
      
      public static const CURSOR_SCALE:String = "CURSOR_SCALE";
      
      private static var _1593:Class = _12__1593;
      
      public static const CURSOR_POSE:String = "CURSOR_POSE";
      
      private static var _1595:Class = _12__1595;
      
      public static const CURSOR_PICK:String = "CURSOR_PICK";
      
      private static var _1594:Class = _12__1594;
      
      public static const CURSOR_FRAME_MOVE:String = "CURSOR_FRAME_MOVE";
      
      private static var _1587:Class = _12__1587;
      
      public static const CURSOR_FRAME_SCALE:String = "CURSOR_FRAME_SCALE";
      
      private static var _1586:Class = _12__1586;
      
      public static const CURSOR_MESH_EDIT:String = "CURSOR_MESH_EDIT";
      
      private static var _1588:Class = _12__1588;
      
      public static const CURSOR_MESH_ADD:String = "CURSOR_MESH_ADD";
      
      private static var _1589:Class = _12__1589;
      
      public static const CURSOR_MESH_DELETE:String = "CURSOR_MESH_DELETE";
      
      private static var _1585:Class = _12__1585;
      
      public static const CURSOR_MESH_OUTLINE:String = "CURSOR_MESH_OUTLINE";
      
      private static var _1583:Class = _12__1583;
      
      public static const CURSOR_MESH_OUTLINE_END:String = "CURSOR_MESH_OUTLINE_END";
      
      private static var _1582:Class = _12__1582;
      
      public static const CURSOR_MESH_WEIGHT:String = "CURSOR_MESH_WEIGHT";
      
      private static var _1584:Class = _12__1584;
      
      public static const CURSOR_MESH_WEIGHT_EDIT:String = "CURSOR_MESH_WEIGHT_EDIT";
      
      private static var _1581:Class = _12__1581;
      
      public static const CURSOR_BOUNDINGBOX_ADD:String = "CURSOR_BOUNDINGBOX_ADD";
      
      private static var _11271:Class = _12__11271;
      
      public static const CURSOR_BOUNDINGBOX_DELETE:String = "CURSOR_BOUNDINGBOX_DELETE";
      
      private static var _11270:Class = _12__11270;
      
      public static const CURSOR_BOUNDINGBOX_OUTLINE_END:String = "CURSOR_BOUNDINGBOX_OUTLINE_END";
      
      private static var _11269:Class = _12__11269;
      
      public function _12()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc4_:Bitmap = null;
         var _loc5_:MouseCursorData = null;
         var _loc1_:Array = [CURSOR_DRAG_HAND_FORKEY,_1599,new Point(9,8.5),CURSOR_DRAG_HAND_FORTOOL,_1599,new Point(9,8.5),CURSOR_CREATE_BONE,_1597,new Point(0,0),CURSOR_APPEND_SLOT,_1596,new Point(0,0),CURSOR_ZOOM_IN,_1591,new Point(15,0),CURSOR_ZOOM_OUT,_1590,new Point(15,0),CURSOR_MOVE,_1598,new Point(0,0),CURSOR_ROTATE,_1592,new Point(0,0),CURSOR_SCALE,_1593,new Point(0,0),CURSOR_FRAME_MOVE,_1587,new Point(8.5,8.5),CURSOR_FRAME_SCALE,_1586,new Point(8.5,8.5),CURSOR_POSE,_1595,new Point(9,8.5),CURSOR_PICK,_1594,new Point(3,0),CURSOR_BOUNDINGBOX_ADD,_11271,new Point(0,0),CURSOR_BOUNDINGBOX_DELETE,_11270,new Point(0,0),CURSOR_BOUNDINGBOX_OUTLINE_END,_11269,new Point(0,0),CURSOR_MESH_EDIT,_1588,new Point(0,8.5),CURSOR_MESH_ADD,_1589,new Point(0,8.5),CURSOR_MESH_DELETE,_1585,new Point(0,8.5),CURSOR_MESH_OUTLINE,_1583,new Point(0,8.5),CURSOR_MESH_OUTLINE_END,_1582,new Point(0,8.5),CURSOR_MESH_WEIGHT,_1584,new Point(0,0),CURSOR_MESH_WEIGHT_EDIT,_1581,new Point(0,0)];
         var _loc2_:int = int(_loc1_.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new _loc1_[_loc3_ + 1]();
            (_loc5_ = new MouseCursorData()).data = new <BitmapData>[_loc4_.bitmapData];
            _loc5_.hotSpot = _loc1_[_loc3_ + 2];
            Mouse.registerCursor(String(_loc1_[_loc3_]),_loc5_);
            _loc3_ += 3;
         }
      }
   }
}

