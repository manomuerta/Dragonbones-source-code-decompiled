package _790
{
   import _1038._1039;
   import _1038._1041;
   import _1177.CollectionEvent;
   import _1177._1178;
   import _51._50;
   import _54._53;
   import _54._56;
   import flash.events.EventDispatcher;
   
   public class _793 extends EventDispatcher implements _1039, _1041
   {
      private var _5856:String;
      
      private var _5859:String;
      
      private var _6050:String;
      
      private var _5864:Object;
      
      private var _5852:Function;
      
      private var _5863:Array;
      
      private var _5857:Array;
      
      private var _5858:Boolean = false;
      
      public function _793(param1:String = "children", param2:String = "parent", param3:String = "type")
      {
         this._5863 = [];
         this._5857 = [];
         super();
         this._5856 = param1;
         this._5859 = param2;
         this._6050 = param3;
      }
      
      public static function _5854(param1:Object, param2:String = "children", param3:String = "parent") : void
      {
         var _loc4_:Object = null;
         if(!param1.hasOwnProperty(param2))
         {
            return;
         }
         for each(_loc4_ in param1[param2])
         {
            try
            {
               _loc4_[param3] = param1;
            }
            catch(e:Error)
            {
            }
            _5854(_loc4_,param2,param3);
         }
      }
      
      public function get source() : Object
      {
         return this._5864;
      }
      
      public function set source(param1:Object) : void
      {
         this._5864 = param1;
         this._5857 = [];
         this._5863 = [];
         if(this._5864)
         {
            if(this._5858)
            {
               this._5863.push(this._5864);
            }
            else
            {
               this._5857 = [this._5864];
               this._5855(this._5864,this._5863);
            }
         }
         this._5853(_1178.RESET);
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
      
      private function isShow(param1:Object) : Boolean
      {
         if(Boolean(param1.hasOwnProperty("visible")) && !param1.visible)
         {
            return false;
         }
         if(param1.hasOwnProperty(this._5856) && param1.children.length == 1 && param1.children[0].hasOwnProperty("visible") && !param1.children[0].visible)
         {
            return false;
         }
         if(this._5852 != null)
         {
            return this._5852(param1);
         }
         return true;
      }
      
      public function get _3591() : Array
      {
         return this._5863;
      }
      
      public function get _5860() : Array
      {
         return this._5857.concat();
      }
      
      public function set _5860(param1:Array) : void
      {
         this._5857 = !!param1 ? param1.concat() : [];
         this.refresh();
      }
      
      public function get length() : int
      {
         return this._5863.length;
      }
      
      public function getItemAt(param1:int) : Object
      {
         return this._5863[param1];
      }
      
      public function getItemIndex(param1:Object) : int
      {
         var _loc2_:int = int(this._5863.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._5863[_loc3_] === param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function _4016(param1:Object) : void
      {
         var _loc2_:int = this.getItemIndex(param1);
         if(_loc2_ != -1)
         {
            this._5853(_1178.UPDATE,_loc2_,-1,[param1]);
         }
      }
      
      public function _4509(param1:Object) : Object
      {
         return param1[this._5859];
      }
      
      public function _4513(param1:Object) : Object
      {
         return param1[this._5856];
      }
      
      public function removeItem(param1:Object) : void
      {
         var deleteItems:Array;
         var item:Object = param1;
         var remove:Function = function(param1:Object, param2:Array):void
         {
            var _loc3_:Object = null;
            var _loc4_:int = 0;
            var _loc5_:Object = null;
            var _loc6_:Object = null;
            if(param1 && !(param1 is _50) && !(param1[_5859] is _50) && Boolean(param1[_5859]) && Boolean(param1[_5859][_5856]))
            {
               _loc3_ = param1[_5859];
               if(_loc3_ is _53 && _loc3_[_5856].indexOf(param1) == 0)
               {
                  _loc4_ = int(_5863.indexOf(param1));
                  _loc5_ = _5863[_loc4_ - 1];
                  _loc6_ = _5863[_loc4_ + 1];
                  if(_loc4_ > 0)
                  {
                     if(_loc6_ is _56 || _loc5_ is _56)
                     {
                        _loc3_.removeItem(param1);
                        param2.push(param1);
                     }
                  }
                  else if(_loc4_ == 0)
                  {
                     if(_loc6_ is _56 || !_loc5_)
                     {
                        _loc3_.removeItem(param1);
                        param2.push(param1);
                     }
                  }
               }
               else
               {
                  _loc3_.removeItem(param1);
                  param2.push(param1);
               }
               if(_loc3_[_5856].length < 1)
               {
                  remove(_loc3_,param2);
               }
            }
         };
         var index:int = int(this._5863.indexOf(item));
         if(this._4530(item))
         {
            this._4745(item);
         }
         deleteItems = [];
         remove(item,deleteItems);
         if(index != -1)
         {
            this._5863.splice(index,1);
            this._5853(_1178.REMOVE,index,-1,[item]);
         }
      }
      
      public function addItem(param1:Object, param2:Object, param3:int = -1) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(Boolean(param1) && Boolean(param2) && Boolean(param2[this._5856]))
         {
            _loc4_ = param2[this._5856];
            _loc5_ = param3;
            if(_loc4_.length > 0)
            {
               _loc6_ = 0;
               while(_loc6_ < this._5863.length)
               {
                  if(this._5863[_loc6_] == _loc4_[0])
                  {
                     _loc5_ += _loc6_;
                     break;
                  }
                  _loc6_++;
               }
            }
            else
            {
               _loc5_ = this._6049 + _loc5_ - 1;
            }
            param2.addItemAt(param1,param3);
            this._5863.splice(_loc5_,0,param1);
            this._5853(_1178.ADD,_loc5_,-1,[param1]);
         }
      }
      
      private function _6049(param1:Object) : int
      {
         return 1;
      }
      
      public function get _5804() : Boolean
      {
         return this._5858;
      }
      
      public function set _5804(param1:Boolean) : void
      {
         if(this._5858 == param1)
         {
            return;
         }
         this._5858 = param1;
         if(this._5864)
         {
            if(this._5858)
            {
               this._5863.splice(0,0,this._5864);
            }
            else
            {
               this._5863.shift();
               if(this._5860.indexOf(this._5864) == -1)
               {
                  this._5860.push(this._5864);
               }
            }
            this.refresh();
         }
      }
      
      private function _5855(param1:Object, param2:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Boolean = false;
         if(!this.isShow(param1) || !param1.hasOwnProperty(this._5856))
         {
            return;
         }
         for each(_loc3_ in param1[this._5856])
         {
            _loc4_ = Boolean(_loc3_.hasOwnProperty(this._6050)) || Boolean(_loc3_.parent) && _loc3_.parent.parent is _50;
            if(this.isShow(_loc3_) && _loc4_)
            {
               param2.push(_loc3_);
            }
            this._5855(_loc3_,param2);
         }
      }
      
      public function _4521(param1:Object) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         if(param1.hasOwnProperty(this._5856))
         {
            if(param1[this._5856].length > 0)
            {
               _loc3_ = 0;
               while(_loc3_ < param1[this._5856].length)
               {
                  _loc4_ = param1[this._5856][_loc3_];
                  if(this.isShow(_loc4_))
                  {
                     _loc2_ = true;
                     break;
                  }
                  _loc3_++;
               }
               return _loc2_;
            }
         }
         return false;
      }
      
      public function _4530(param1:Object) : Boolean
      {
         return this._5857.indexOf(param1) != -1;
      }
      
      public function _4529(param1:Object, param2:Boolean = true) : void
      {
         if(param2)
         {
            this._4752(param1);
         }
         else
         {
            this._4745(param1);
         }
      }
      
      private function _4752(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         if(this._5857.indexOf(param1) == -1 && this.isShow(param1))
         {
            this._5857.push(param1);
            _loc2_ = int(this._5863.indexOf(param1));
            if(_loc2_ != -1)
            {
               _loc3_ = [];
               this._5855(param1,_loc3_);
               _loc4_ = _loc2_;
               while(_loc3_.length)
               {
                  _loc4_++;
                  _loc5_ = _loc3_.shift();
                  this._5863.splice(_loc4_,0,_loc5_);
                  this._5853(_1178.ADD,_loc4_,-1,[_loc5_]);
               }
               this._5853("open",_loc2_,_loc2_,[param1]);
            }
         }
      }
      
      private function _4745(param1:Object) : void
      {
         var _loc5_:Object = null;
         var _loc2_:int = this._5858 ? 0 : 1;
         var _loc3_:int = int(this._5857.indexOf(param1));
         if(_loc3_ == -1 || _loc3_ == _loc2_)
         {
            return;
         }
         var _loc4_:Array = [];
         this._5855(param1,_loc4_);
         this._5857.splice(_loc3_,1);
         _loc3_ = int(this._5863.indexOf(param1));
         if(_loc3_ != -1)
         {
            _loc3_++;
            while(_loc4_.length)
            {
               _loc5_ = this._5863.splice(_loc3_,1)[0];
               this._5853(_1178.REMOVE,_loc3_,-1,[_loc5_]);
               _loc4_.shift();
            }
            _loc3_--;
            this._5853(_1178.CLOSE,_loc3_,_loc3_,[param1]);
         }
      }
      
      public function _5862(param1:Object) : int
      {
         var _loc2_:int = 0;
         if(!param1.hasOwnProperty(this._5859))
         {
            return _loc2_;
         }
         var _loc3_:Object = param1[this._5859];
         while(Boolean(_loc3_) && !(_loc3_ is _50))
         {
            _loc2_++;
            _loc3_ = _loc3_[this._5859];
         }
         if(_loc2_ > 0 && !this._5858)
         {
            _loc2_--;
         }
         return _loc2_;
      }
      
      public function refresh() : void
      {
         this._5863 = [];
         if(this._5864)
         {
            if(this._5858)
            {
               this._5863.push(this._5864);
            }
            this._5855(this._5864,this._5863);
         }
         this._5853(_1178.REFRESH);
      }
      
      private function _5853(param1:String = null, param2:int = -1, param3:int = -1, param4:Array = null, param5:Array = null) : void
      {
         var _loc6_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,false,param1,param2,param3,param4,param5);
         dispatchEvent(_loc6_);
      }
   }
}

