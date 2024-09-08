package _521
{
   import _18.DBActionGroup;
   import _18.DBHistoryEvent;
   import _18.IAction;
   import _18._21;
   import _6._7;
   import _783._782;
   
   public class _525 extends _7
   {
      private var _3790:_21;
      
      public function _525()
      {
         super();
      }
      
      public function addAction(param1:IAction) : void
      {
         if(!this._3790 || !param1._1637)
         {
            return;
         }
         this._3790.addAction(param1);
      }
      
      public function _1651() : void
      {
         if(!this._3790)
         {
            return;
         }
         this._3790._1651();
      }
      
      public function get _3297() : Boolean
      {
         var _loc1_:DBActionGroup = null;
         if(this._3790)
         {
            if(Boolean(this._3790._1636) && this._3790._1636.length > 0)
            {
               _loc1_ = this._3790._1636[this._3790._1636.length - 1] as DBActionGroup;
               if(_loc1_)
               {
                  return _loc1_._1643;
               }
            }
         }
         return false;
      }
      
      public function _3792() : void
      {
         if(!this._3790)
         {
            return;
         }
         this._3790.addAction(new DBActionGroup());
      }
      
      public function _1652() : void
      {
         if(!this._3790)
         {
            return;
         }
         this._3790._1652();
      }
      
      public function _1650() : void
      {
         if(!this._3790)
         {
            return;
         }
         this._3790._1650();
      }
      
      public function undo() : void
      {
         this._3790.undo();
      }
      
      public function redo() : void
      {
         this._3790.redo();
      }
      
      public function _11598() : String
      {
         var _loc2_:int = 0;
         var _loc3_:IAction = null;
         var _loc1_:String = "";
         if(this._3790)
         {
            _loc2_ = 0;
            for each(_loc3_ in this._3790._1636)
            {
               _loc1_ += _loc3_._1799 + " @ ";
               if(++_loc2_ > 10)
               {
                  break;
               }
            }
         }
         return _loc1_;
      }
      
      public function get _1653() : Boolean
      {
         return !!this._3790 ? this._3790._1653 : false;
      }
      
      public function get _1654() : Boolean
      {
         return !!this._3790 ? this._3790._1654 : false;
      }
      
      public function get _1658() : Boolean
      {
         return !!this._3790 ? this._3790._1658 : false;
      }
      
      public function set _3791(param1:_21) : void
      {
         if(this._3790 == param1)
         {
            return;
         }
         if(this._3790)
         {
            this._3790.removeEventListener(DBHistoryEvent.UNDOABLE_CHANGED,this._3787);
            this._3790.removeEventListener(DBHistoryEvent.REDOABLE_CHANGED,this._3788);
            this._3790.removeEventListener(DBHistoryEvent.SAVEABLE_CHANGED,this._3789);
         }
         this._3790 = param1;
         if(this._3790)
         {
            this._3790.addEventListener(DBHistoryEvent.UNDOABLE_CHANGED,this._3787);
            this._3790.addEventListener(DBHistoryEvent.REDOABLE_CHANGED,this._3788);
            this._3790.addEventListener(DBHistoryEvent.SAVEABLE_CHANGED,this._3789);
         }
         this._3787(null);
         this._3788(null);
         this._3789(null);
      }
      
      private function _3787(param1:DBHistoryEvent) : void
      {
         _1567(new _782(_782.UNDOABLE_CHANGED));
      }
      
      private function _3788(param1:DBHistoryEvent) : void
      {
         _1567(new _782(_782.REDOABLE_CHANGED));
      }
      
      private function _3789(param1:DBHistoryEvent) : void
      {
         _1567(new _782(_782.SAVEABLE_CHANGED));
      }
      
      public function _10699() : void
      {
         _1567(new _782(_782.SAVEABLE_CHANGED));
      }
   }
}

