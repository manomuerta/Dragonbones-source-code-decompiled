package _978
{
   import _1045.Tree;
   import _1421.TreeDragEvent;
   
   public class _979 extends Tree
   {
      private var _2607:_995;
      
      private var _2361:Number;
      
      public function _979()
      {
         super();
         this._2607 = new _995();
         this._2607.init(this);
         this._2607._6005 = function(param1:Object, param2:Array):void
         {
            var _loc3_:TreeDragEvent = new TreeDragEvent(TreeDragEvent.ITEMS_DRAG_IN_COMPLETE);
            _loc3_._3597 = param2;
            _loc3_._4137 = param1;
            if(dispatchEvent(_loc3_))
            {
               _2607.doDrag(param1,param2);
            }
         };
         this._2607._6000 = function(param1:Object, param2:Array, param3:Boolean):void
         {
            var _loc4_:TreeDragEvent;
            (_loc4_ = new TreeDragEvent(TreeDragEvent.ITEMS_DRAG_MOVE_COMPLETE))._3597 = param2;
            _loc4_._4137 = param1;
            _loc4_._4136 = param3;
            if(dispatchEvent(_loc4_))
            {
               _2607._6035(param1,param2,param3);
            }
         };
         this._2607._6022 = function(param1:Array):void
         {
            var _loc2_:TreeDragEvent = new TreeDragEvent(TreeDragEvent.ITEMS_DRAG_START);
            _loc2_._3597 = param1;
            dispatchEvent(_loc2_);
         };
      }
      
      override public function set width(param1:Number) : void
      {
         this._2361 = param1;
         super.width = param1;
      }
      
      override public function setActualSize(param1:Number, param2:Number) : void
      {
         param1 = this._2361;
         super.setActualSize(param1,param2);
      }
      
      public function get _6031() : Boolean
      {
         return this._2607._6031;
      }
      
      public function set _6031(param1:Boolean) : void
      {
         this._2607._6031 = param1;
      }
      
      public function get _6033() : Boolean
      {
         return this._2607._6033;
      }
      
      public function set _6033(param1:Boolean) : void
      {
         this._2607._6033 = param1;
      }
      
      public function get _3573() : Function
      {
         return this._2607._3573;
      }
      
      public function set _3573(param1:Function) : void
      {
         this._2607._3573 = param1;
      }
      
      public function get _3576() : Function
      {
         return this._2607._3576;
      }
      
      public function set _3576(param1:Function) : void
      {
         this._2607._3576 = param1;
      }
      
      public function get _6011() : Function
      {
         return this._2607._6011;
      }
      
      public function set _6011(param1:Function) : void
      {
         this._2607._6011 = param1;
      }
      
      public function get _4500() : Function
      {
         return this._2607._4500;
      }
      
      public function set _4500(param1:Function) : void
      {
         this._2607._4500 = param1;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == _2490)
         {
            this._2607._6023(_2490);
         }
      }
   }
}

