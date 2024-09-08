package _1038
{
   import _1177.CollectionEvent;
   import _1177._1178;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   use namespace flash_proxy;
   
   public class _1037 extends Proxy implements _1040, _1039
   {
      private var _5864:Array;
      
      private var _7398:Array;
      
      private var _5852:Function;
      
      private var eventDispatcher:EventDispatcher;
      
      public function _1037(param1:Array = null)
      {
         super();
         this.eventDispatcher = new EventDispatcher(this);
         if(param1)
         {
            this._5864 = param1;
         }
         else
         {
            this._5864 = [];
         }
      }
      
      public function get source() : Array
      {
         return this._5864;
      }
      
      public function set source(param1:Array) : void
      {
         if(!param1)
         {
            param1 = [];
         }
         this._5864 = param1;
         this._5853(_1178.RESET);
      }
      
      public function sort(param1:Function = null) : void
      {
         if(param1 != null)
         {
            this._5864.sort(param1);
            if(this._7398)
            {
               this._7398.sort(param1);
            }
         }
         else
         {
            this._5864.sort();
            if(this._7398)
            {
               this._7398.sort();
            }
         }
         this.refresh();
      }
      
      public function sortOn(param1:String, param2:*) : void
      {
         this._5864.sortOn(param1,param2);
         if(this._7398)
         {
            this._7398.sortOn(param1,param2);
         }
         this.refresh();
      }
      
      private function _7402() : Array
      {
         return !!this._7398 ? this._7398 : this._5864;
      }
      
      public function get _4505() : Function
      {
         return this._5852;
      }
      
      public function set _4505(param1:Function) : void
      {
         if(this._5852 == param1)
         {
            return;
         }
         this._5852 = param1;
         this.refresh();
      }
      
      private function _7397() : void
      {
         var _loc1_:Object = null;
         if(this._5852 != null)
         {
            this._7398 = [];
            for each(_loc1_ in this._5864)
            {
               if(this._5852(_loc1_))
               {
                  this._7398.push(_loc1_);
               }
            }
         }
         else
         {
            this._7398 = null;
         }
      }
      
      public function refresh() : void
      {
         this._7397();
         this._5853(_1178.REFRESH);
      }
      
      public function _15557() : void
      {
         this._5853(_1178.REFRESH);
      }
      
      public function contains(param1:Object) : Boolean
      {
         return this.getItemIndex(param1) != -1;
      }
      
      private function _7399(param1:int) : void
      {
         var _loc2_:Array = this._7402();
         if(param1 < 0 || param1 >= _loc2_.length)
         {
            throw new RangeError("索引:\"" + param1 + "\"超出集合元素索引范围");
         }
      }
      
      public function get length() : int
      {
         return this._7402().length;
      }
      
      public function addItem(param1:Object) : void
      {
         this._5864.push(param1);
         if(this._5852 != null)
         {
            if(this._5852(param1))
            {
               this._7398.push(param1);
               this._5853(_1178.ADD,this._5864.length - 1,-1,[param1]);
            }
         }
         else
         {
            this._5853(_1178.ADD,this._5864.length - 1,-1,[param1]);
         }
      }
      
      public function addItemAt(param1:Object, param2:int) : void
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc3_:Array = this._7402();
         if(param2 < 0 || param2 > _loc3_.length)
         {
            throw new RangeError("索引:\"" + param2 + "\"超出集合元素索引范围");
         }
         if(this._5852 != null)
         {
            _loc4_ = this._7398[param2];
            if(_loc4_)
            {
               _loc5_ = int(this._5864.indexOf(_loc4_));
            }
            else
            {
               _loc5_ = int(this._5864.length);
            }
            this._5864.splice(_loc5_,0,param1);
            if(this._5852(param1))
            {
               this._7398.splice(param2,0,param1);
               this._5853(_1178.ADD,param2,-1,[param1]);
            }
         }
         else
         {
            this._5864.splice(param2,0,param1);
            this._5853(_1178.ADD,param2,-1,[param1]);
         }
      }
      
      public function getItemAt(param1:int) : Object
      {
         var _loc2_:Array = this._7402();
         return _loc2_[param1];
      }
      
      public function getItemIndex(param1:Object) : int
      {
         var _loc2_:Array = this._7402();
         return _loc2_.indexOf(param1);
      }
      
      public function _4016(param1:Object) : void
      {
         var _loc2_:int = this.getItemIndex(param1);
         if(_loc2_ != -1)
         {
            this._5853(_1178.UPDATE,_loc2_,-1,[param1]);
         }
      }
      
      public function _6162() : void
      {
         var _loc1_:Array = this._7402();
         var _loc2_:Array = _loc1_.concat();
         this._5864.length = 0;
         if(this._7398)
         {
            this._7398.length = 0;
         }
         this._5853(_1178.REMOVE,0,-1,_loc2_);
      }
      
      public function removeItemAt(param1:int) : Object
      {
         var _loc4_:int = 0;
         this._7399(param1);
         var _loc2_:Array = this._7402();
         var _loc3_:Object = _loc2_.splice(param1,1)[0];
         if(this._7398)
         {
            _loc4_ = int(this._5864.indexOf(_loc3_));
            if(_loc4_ != -1)
            {
               this._5864.splice(_loc4_,1);
            }
         }
         this._5853(_1178.REMOVE,param1,-1,[_loc3_]);
         return _loc3_;
      }
      
      public function _7396(param1:Object, param2:int) : Object
      {
         var _loc5_:int = 0;
         this._7399(param2);
         var _loc3_:Array = this._7402();
         var _loc4_:Object = _loc3_.splice(param2,1,param1)[0];
         if(this._7398)
         {
            _loc5_ = int(this._5864.indexOf(_loc4_));
            if(_loc5_ != -1)
            {
               this._5864.splice(_loc5_,1,param1);
            }
         }
         this._5853(_1178.REPLACE,param2,-1,[param1],[_loc4_]);
         return _loc4_;
      }
      
      public function _7400(param1:Array) : void
      {
         if(!param1)
         {
            param1 = [];
         }
         var _loc2_:int = int(param1.length);
         var _loc3_:int = this.length;
         var _loc4_:int = _loc2_;
         while(_loc4_ < _loc3_)
         {
            this.removeItemAt(_loc2_);
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            if(_loc4_ >= _loc3_)
            {
               this.addItemAt(param1[_loc4_],_loc4_);
            }
            else
            {
               this._7396(param1[_loc4_],_loc4_);
            }
            _loc4_++;
         }
         this._5864 = param1;
         this._7397();
      }
      
      public function _7401(param1:int, param2:int) : Object
      {
         var _loc6_:int = 0;
         this._7399(param1);
         this._7399(param2);
         var _loc3_:Array = this._7402();
         var _loc4_:Object = _loc3_.splice(param1,1)[0];
         var _loc5_:Object = _loc3_[param2];
         _loc3_.splice(param2,0,_loc4_);
         if(this._7398)
         {
            _loc6_ = int(this._5864.indexOf(_loc4_));
            if(_loc6_ != -1)
            {
               this._5864.splice(_loc6_,1);
               _loc6_ = int(this._5864.indexOf(_loc5_));
               this._5864.splice(_loc6_,0,_loc4_);
            }
         }
         this._5853(_1178.MOVE,param2,param1,[_loc4_]);
         return _loc4_;
      }
      
      private function _5853(param1:String = null, param2:int = -1, param3:int = -1, param4:Array = null, param5:Array = null) : void
      {
         var _loc6_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,false,param1,param2,param3,param4,param5);
         this.dispatchEvent(_loc6_);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this.eventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this.eventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this.eventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this.eventDispatcher.hasEventListener(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this.eventDispatcher.willTrigger(param1);
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         var _loc2_:int = this._7395(param1);
         return this.getItemAt(_loc2_);
      }
      
      private function _7395(param1:*) : int
      {
         var _loc3_:Number = NaN;
         if(param1 is QName)
         {
            param1 = param1.localName;
         }
         var _loc2_:int = -1;
         try
         {
            _loc3_ = parseInt(String(param1));
            if(!isNaN(_loc3_))
            {
               _loc2_ = int(_loc3_);
            }
         }
         catch(e:Error)
         {
         }
         return _loc2_;
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         var _loc3_:int = this._7395(param1);
         this._7396(param2,_loc3_);
      }
      
      override flash_proxy function hasProperty(param1:*) : Boolean
      {
         var _loc2_:int = this._7395(param1);
         if(_loc2_ == -1)
         {
            return false;
         }
         return _loc2_ >= 0 && _loc2_ < this.length;
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         return param1 < this.length ? param1 + 1 : 0;
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return (param1 - 1).toString();
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return this.getItemAt(param1 - 1);
      }
      
      override flash_proxy function callProperty(param1:*, ... rest) : *
      {
         return null;
      }
   }
}

