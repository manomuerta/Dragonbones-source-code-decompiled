package _790
{
   import _1038._1039;
   import _1045.Group;
   import _1177.UIEvent;
   import _127._163;
   import _1421.TreeDragEvent;
   import _1439._1242;
   import _54._67;
   import _799._798;
   import _799._801;
   import egret.core._1139;
   
   public class _795 extends Group
   {
      public var _6057:Number = 30;
      
      public var textColor:uint = 16777215;
      
      public var borderColor:uint = 3622226;
      
      public var _3562:_793;
      
      public var tree:_163;
      
      public var _6054:_796;
      
      public function _795()
      {
         this.tree = new _163();
         this._6054 = new _796();
         super();
         this.tree._2606 = this._6054;
      }
      
      public function _3583(param1:_1039) : void
      {
         this._3562 = param1 as _793;
         this.tree.dataProvider = param1;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.tree.left = 15;
         this.tree.right = 15;
         this.tree.top = 0;
         this.tree.bottom = 0;
         this.tree._3854 = true;
         this.tree._6056 = false;
         this.tree.doubleClickEnabled = true;
         this.tree._6053 = function(param1:Object):Class
         {
            if(!param1 || !(param1 is _67))
            {
               return _801;
            }
            return _798;
         };
         this.tree._3573 = function _3593(param1:Object, param2:Array, param3:Boolean, param4:_789):Boolean
         {
            return true;
         };
         this.tree._2606._6005 = function(param1:Object, param2:Array):void
         {
            var _loc3_:TreeDragEvent = new TreeDragEvent(TreeDragEvent.ITEMS_DRAG_IN_COMPLETE);
            _loc3_._3597 = param2;
            _loc3_._4137 = param1;
            if(dispatchEvent(_loc3_))
            {
               tree._2606.doDrag(param1,param2);
            }
         };
         this.tree.addEventListener(UIEvent.CREATION_COMPLETE,function(param1:UIEvent):void
         {
            if(Boolean(tree.skin) && tree.skin is _1242)
            {
               (tree.skin as _1242)._2491._6052 = _1139.OFF;
            }
         });
         this.tree._6033 = true;
         this.tree._6031 = true;
         this.tree._6055 = false;
         addElement(this.tree);
      }
      
      public function set _3573(param1:Function) : void
      {
         this.tree._3573 = param1;
      }
      
      public function set _3576(param1:Function) : void
      {
         this.tree._3576 = param1;
      }
   }
}

