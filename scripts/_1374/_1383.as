package _1374
{
   import _1045.DataGrid;
   import _1045.Group;
   import _1045.Label;
   import _1045._1068;
   import _1045._1105;
   import _1049._1053;
   import _1049._1057;
   import _1439._1443;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   
   public class _1383 extends _1057
   {
      private static const DEFAULT_COLOR_VALUE:uint = 204;
      
      private static const DEFAULT_COLOR:uint = 13421772;
      
      private static const DEFAULT_SYMBOL_COLOR:uint = 0;
      
      private static var colorTransform:ColorTransform = new ColorTransform();
      
      public var _9689:Group;
      
      public var _9688:Group;
      
      public var sortDown:_1105;
      
      public var sortUp:_1105;
      
      private var _8057:int = 1;
      
      public function _1383()
      {
         super();
         this.skinName = _1443;
      }
      
      private function _2470(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new Event(param1));
         }
      }
      
      public function get _6080() : int
      {
         return this._8057;
      }
      
      public function set _6080(param1:int) : void
      {
         if(param1 == this._8057)
         {
            return;
         }
         this._8057 = param1;
         if(Label(labelDisplay))
         {
            Label(labelDisplay)._6080 = param1;
         }
         invalidateSize();
         invalidateDisplayList();
         this._2470("maxDisplayedLinesChanged");
      }
      
      override public function prepare(param1:Boolean) : void
      {
         var _loc3_:DataGrid = null;
         var _loc4_:_1068 = null;
         super.prepare(param1);
         if(labelDisplay && this._9689 && labelDisplay.parent != this._9689)
         {
            this._9689._2426();
            this._9689.addElement(labelDisplay);
         }
         var _loc2_:_1053 = this.column;
         if(_loc2_ && _loc2_.grid && _loc2_.grid._5598 && Boolean(_loc2_.grid._5598._7506))
         {
            _loc3_ = _loc2_.grid._5598;
            _loc4_ = _loc3_._7506;
            if(_loc4_._8013(_loc2_.columnIndex))
            {
               this._9688.includeInLayout = true;
               if(_loc2_._7537)
               {
                  this.sortDown.visible = this.sortDown.includeInLayout = true;
                  this.sortUp.visible = this.sortUp.includeInLayout = false;
               }
               else
               {
                  this.sortDown.visible = this.sortDown.includeInLayout = false;
                  this.sortUp.visible = this.sortUp.includeInLayout = true;
               }
            }
            else
            {
               this._9688.includeInLayout = false;
               this.sortDown.visible = this.sortDown.includeInLayout = false;
               this.sortUp.visible = this.sortUp.includeInLayout = false;
            }
         }
      }
   }
}

