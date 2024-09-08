package _1177
{
   import _1049._1053;
   import flash.events.Event;
   
   public class GridItemEditorEvent extends Event
   {
      public static const GRID_ITEM_EDITOR_SESSION_STARTING:String = "gridItemEditorSessionStarting";
      
      public static const GRID_ITEM_EDITOR_SESSION_START:String = "gridItemEditorSessionStart";
      
      public static const GRID_ITEM_EDITOR_SESSION_SAVE:String = "gridItemEditorSessionSave";
      
      public static const GRID_ITEM_EDITOR_SESSION_CANCEL:String = "gridItemEditorSessionCancel";
      
      public var columnIndex:int;
      
      public var column:_1053;
      
      public var _6589:int;
      
      public function GridItemEditorEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:int = -1, param5:int = -1, param6:_1053 = null)
      {
         super(param1,param2,param3);
         this._6589 = param4;
         this.columnIndex = param5;
         this.column = param6;
      }
      
      override public function clone() : Event
      {
         return new GridItemEditorEvent(type,bubbles,cancelable,this._6589,this.columnIndex,this.column);
      }
   }
}

