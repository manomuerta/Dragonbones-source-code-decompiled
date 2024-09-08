package egret.managers
{
   import egret.core.Injector;
   import egret.core._1111;
   import egret.core.ns_egret;
   import egret.managers.impl._1207;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   
   use namespace ns_egret;
   
   public class DragManager
   {
      private static var _impl:_1203;
      
      public function DragManager()
      {
         super();
      }
      
      private static function get impl() : _1203
      {
         if(!_impl)
         {
            try
            {
               _impl = Injector.getInstance(_1203);
            }
            catch(e:Error)
            {
               _impl = new _1207();
            }
         }
         return _impl;
      }
      
      public static function get isDragging() : Boolean
      {
         return impl.isDragging;
      }
      
      public static function doDrag(param1:InteractiveObject, param2:_1111, param3:DisplayObject = null, param4:Number = 0, param5:Number = 0, param6:Number = 0.5) : void
      {
         impl.doDrag(param1,param2,param3,param4,param5,param6);
      }
      
      public static function acceptDragDrop(param1:InteractiveObject) : void
      {
         impl.acceptDragDrop(param1);
      }
      
      ns_egret static function endDrag() : void
      {
         impl.endDrag();
      }
   }
}

