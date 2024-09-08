package _799
{
   import _1038._1039;
   import _1045.Label;
   import _1045._1082;
   import _1088.TreeItemRenderer;
   import _1177.UIEvent;
   import _127._163;
   import _54._53;
   import _54._56;
   import _54._57;
   import _54._67;
   import _73._72;
   import _790._795;
   
   public class _798 extends TreeItemRenderer
   {
      public var title:Label;
      
      public var _6075:Label;
      
      public var _1799:Label;
      
      public var _6072:_1082;
      
      public var _6069:_1082;
      
      public var _6068:_1082;
      
      public var _6066:_1039;
      
      public var tree:_163;
      
      public var comicTree:_795;
      
      public var _6076:Boolean = false;
      
      public var _6077:Boolean = false;
      
      public var _6064:int = 0;
      
      public var index:int = 0;
      
      public var _6071:Array;
      
      protected var _6074:_57;
      
      public function _798()
      {
         super();
         height = 22;
         _6070 = 0;
         this.skinName = _800;
         this.addEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
      }
      
      private function onComplete(param1:UIEvent) : void
      {
         this._6065();
      }
      
      private function _6065() : void
      {
         if(Boolean(this.owner) && (!this.tree || !this.comicTree))
         {
            this.tree = this.owner as _163;
            this.comicTree = this.tree.owner as _795;
            width = this.tree.width;
            this._6066 = this.tree.dataProvider;
         }
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:_67 = null;
         this._6065();
         super.data = param1;
         if(param1)
         {
            this._6074 = data.parent as _57;
            this._6071 = this._6074.children as Array;
            for each(_loc2_ in this._6071)
            {
               if(!_loc2_.visible)
               {
                  this._6071.splice(this._6071.indexOf(_loc2_),1);
               }
            }
            this._6064 = this._6071.length;
            this.index = this._6071.indexOf(data);
            this.updateTitle();
         }
         else
         {
            this._6076 = false;
            this._6077 = false;
            this._6064 = 0;
            this.index = 0;
            this._6071 = [];
            this._6074 = null;
         }
         _2466();
      }
      
      protected function updateTitle() : void
      {
         this._6067();
         this._6076 = this.index == 0;
         this._6077 = this.index == this._6071.length - 1;
         invalidateDisplayList();
      }
      
      protected function _6073() : void
      {
         if(!data)
         {
            return;
         }
         this._6075.text = data.name;
         this._1799.text = _72.actionHashObject[data.type.toString()] + "";
      }
      
      private function _6067() : void
      {
         var getTrackVOIndex:Function = function(param1:_53):int
         {
            var _loc6_:_56 = null;
            var _loc7_:int = 0;
            var _loc8_:_57 = null;
            var _loc9_:_67 = null;
            var _loc10_:int = 0;
            var _loc2_:int = 0;
            var _loc3_:int = 0;
            var _loc4_:int = 0;
            var _loc5_:int = 0;
            while(_loc5_ < param1.children.length)
            {
               _loc6_ = param1.children[_loc5_];
               if(_loc6_.children.length == 0)
               {
                  _loc2_ += 1;
               }
               _loc7_ = 0;
               while(_loc7_ < _loc6_.children.length)
               {
                  _loc8_ = _loc6_.children[_loc7_];
                  if(_loc8_.children.length > 0)
                  {
                     _loc3_ += 1;
                  }
                  if(_loc8_.children.length > 0)
                  {
                     for each(_loc9_ in _loc8_.children)
                     {
                        if(!_loc9_.visible)
                        {
                           _loc4_ += 1;
                        }
                     }
                     _loc10_ = int(_loc8_.children.indexOf(data));
                     if(_loc10_ >= 0)
                     {
                        return _loc3_ - _loc2_ - _loc4_;
                     }
                  }
                  _loc7_++;
               }
               _loc5_++;
            }
            return 0;
         };
         var _3074:int = getTrackVOIndex(data.parent.parent.parent);
         this.title.text = _3074 + "";
         data.title = _3074 + "";
         this.title.visible = this.index == this._6071.length - 1;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == _2615)
         {
            _2615.alpha = 0;
         }
         else if(param2 == _2448)
         {
            _2448.visible = false;
         }
      }
   }
}

