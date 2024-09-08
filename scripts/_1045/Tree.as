package _1045
{
   import _1038._1041;
   import _1088.TreeItemRenderer;
   import _1177.CollectionEvent;
   import _1177.RendererExistenceEvent;
   import _1177.TreeEvent;
   import _1177._1178;
   
   public class Tree extends List
   {
      private var _8106:Boolean = false;
      
      private var _8125:String;
      
      private var _8117:Function;
      
      public function Tree()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         if(!itemRenderer)
         {
            itemRenderer = TreeItemRenderer;
         }
         super._2438();
      }
      
      override public function _2481(param1:_1070, param2:int, param3:Object) : _1070
      {
         var _loc4_:_1041 = null;
         var _loc5_:_1072 = null;
         if(param1 is _1072 && dataProvider is _1041)
         {
            _loc4_ = dataProvider as _1041;
            (_loc5_ = param1 as _1072)._4521 = _loc4_._4521(param3);
            _loc5_.opened = _loc4_._4530(param3);
            _loc5_.depth = _loc4_._5862(param3);
            _loc5_._5988 = this._8124(param3);
         }
         return super._2481(param1,param2,param3);
      }
      
      public function _8124(param1:Object) : Object
      {
         var _loc2_:Object = null;
         if(!param1)
         {
            return null;
         }
         if(this._8117 != null)
         {
            return this._8117(param1);
         }
         if(param1 is XML)
         {
            try
            {
               if(param1[this._6377].length() != 0)
               {
                  _loc2_ = String(param1[this._6377]);
               }
            }
            catch(e:Error)
            {
            }
         }
         else if(param1 is Object)
         {
            try
            {
               if(param1[this._6377])
               {
                  _loc2_ = param1[this._6377];
               }
            }
            catch(e:Error)
            {
            }
         }
         return _loc2_;
      }
      
      override protected function _2603(param1:RendererExistenceEvent) : void
      {
         super._2603(param1);
         if(param1._2487 is _1072)
         {
            param1._2487.addEventListener(TreeEvent.ITEM_OPENING,this._8579);
         }
      }
      
      private function _8579(param1:TreeEvent) : void
      {
         var _loc4_:* = false;
         var _loc5_:String = null;
         var _loc6_:TreeEvent = null;
         var _loc2_:_1072 = param1.itemRenderer;
         var _loc3_:Object = param1.item;
         if(!_loc2_ || !(dataProvider is _1041))
         {
            return;
         }
         if(dispatchEvent(param1))
         {
            _loc4_ = !_loc2_.opened;
            _1041(dataProvider)._4529(_loc3_,_loc4_);
            _loc5_ = _loc4_ ? TreeEvent.ITEM_OPEN : TreeEvent.ITEM_CLOSE;
            _loc6_ = new TreeEvent(_loc5_,false,false,_loc2_.itemIndex,_loc3_,_loc2_);
            dispatchEvent(_loc6_);
         }
      }
      
      override protected function _2601(param1:RendererExistenceEvent) : void
      {
         super._2601(param1);
         if(param1._2487 is _1072)
         {
            param1._2487.removeEventListener(TreeEvent.ITEM_OPENING,this._8579);
         }
      }
      
      public function get _6377() : String
      {
         return this._8125;
      }
      
      public function set _6377(param1:String) : void
      {
         if(this._8125 == param1)
         {
            return;
         }
         this._8125 = param1;
         this._8106 = true;
         _2466();
      }
      
      public function get iconFunction() : Function
      {
         return this._8117;
      }
      
      public function set iconFunction(param1:Function) : void
      {
         if(this._8117 == param1)
         {
            return;
         }
         this._8117 = param1;
         this._8106 = true;
         _2466();
      }
      
      public function _4529(param1:Object, param2:Boolean = true) : void
      {
         if(!(dataProvider is _1041))
         {
            return;
         }
         _1041(dataProvider)._4529(param1,param2);
      }
      
      public function _4530(param1:Object) : Boolean
      {
         if(!(dataProvider is _1041))
         {
            return false;
         }
         return _1041(dataProvider)._4530(param1);
      }
      
      override protected function _2457(param1:CollectionEvent) : void
      {
         var _loc2_:_1072 = null;
         super._2457(param1);
         if(param1.kind == _1178.OPEN || param1.kind == _1178.CLOSE)
         {
            _loc2_ = !!_2490 ? _2490.getElementAt(param1.location) as _1072 : null;
            if(_loc2_)
            {
               this._2481(_loc2_,param1.location,param1.items[0]);
               if(param1.kind == _1178.CLOSE && layout && layout._6056)
               {
                  layout._7479();
                  invalidateSize();
               }
            }
         }
      }
      
      override protected function _2476() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super._2476();
         if(this._8106)
         {
            if(_2490 != null)
            {
               if(Boolean(layout) && layout._6056)
               {
                  for each(_loc1_ in _2490._7581())
                  {
                     this._8578(_loc1_);
                  }
               }
               else
               {
                  _loc2_ = _2490._2249;
                  _loc1_ = 0;
                  while(_loc1_ < _loc2_)
                  {
                     this._8578(_loc1_);
                     _loc1_++;
                  }
               }
            }
            this._8106 = false;
         }
      }
      
      private function _8578(param1:int) : void
      {
         var _loc2_:_1072 = _2490.getElementAt(param1) as _1072;
         if(_loc2_)
         {
            _loc2_._5988 = this._8124(_loc2_.data);
         }
      }
      
      public function _4550(param1:Object) : void
      {
         var _loc3_:Object = null;
         if(!_2490 || !dataProvider || !param1)
         {
            return;
         }
         if(dataProvider is _1041)
         {
            _loc3_ = param1.parent;
            while(_loc3_)
            {
               _1041(dataProvider)._4529(_loc3_);
               _loc3_ = _loc3_.parent;
            }
         }
         var _loc2_:int = dataProvider.getItemIndex(param1);
         _8098(_loc2_);
      }
   }
}

