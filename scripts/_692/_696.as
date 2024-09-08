package _692
{
   import _51._50;
   import _51._70;
   import _51._71;
   import _51._79;
   import _703._702;
   import _703._704;
   import _724._13550;
   import _724._723;
   import _724._733;
   import _724._734;
   import _755._757;
   import _81._84;
   import egret.utils.FileUtil;
   import flash.system.System;
   import flash.utils.Dictionary;
   
   public class _696 extends _704
   {
      private var _5848:Vector.<_733>;
      
      private var _5849:Object;
      
      private var _5843:Vector.<_695>;
      
      private var _5844:Object;
      
      private var _3254:_71;
      
      private var _5842:_694;
      
      public var _13739:Dictionary;
      
      public var _13748:Dictionary;
      
      public function _696(param1:_757, param2:_71)
      {
         var _loc3_:_733 = null;
         var _loc4_:String = null;
         var _loc5_:_695 = null;
         var _loc7_:_13550 = null;
         var _loc8_:_13549 = null;
         var _loc10_:_50 = null;
         var _loc11_:_694 = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         this._13739 = new Dictionary();
         this._13748 = new Dictionary();
         super();
         _3670 = param1;
         this._3254 = param2;
         if(param1 == null || param2 == null)
         {
            return;
         }
         this._5843 = new Vector.<_695>();
         this._5848 = new Vector.<_733>();
         this._5849 = {};
         this._5844 = {};
         if(param1._5850)
         {
            _loc13_ = 0;
            _loc14_ = int(param1._5850.length);
            while(_loc13_ < _loc14_)
            {
               _loc4_ = param1._5850[_loc13_];
               _loc3_ = _734._5845(this._5847(_loc4_,param1.projectPath),_loc4_);
               if(_loc3_)
               {
                  this._5848.push(_loc3_);
                  this._5849[_loc4_] = _loc3_;
               }
               _loc13_++;
            }
         }
         if(param1._3284)
         {
            for(_loc15_ in param1._3284)
            {
               _loc4_ = param1._3284[_loc15_];
               _loc3_ = this._5849[_loc4_];
               (_loc5_ = new _695(_loc3_)).name = _loc4_;
               this._5843.push(_loc5_);
               this._5844[_loc15_] = _loc5_;
            }
         }
         this._10560();
         var _loc6_:Array = _3670._13788;
         var _loc9_:int = 0;
         while(_loc9_ < _loc6_.length)
         {
            _loc7_ = _loc6_[_loc9_];
            if(_loc7_._13695 is _757)
            {
               _loc8_ = _13549._3996(this,_loc7_);
            }
            else if(_loc7_._13695 is _13550)
            {
               _loc8_ = _13549._3996(this._13739[_loc7_._13695],_loc7_);
            }
            this._13739[_loc7_] = _loc8_;
            _loc9_++;
         }
         var _loc12_:int = 0;
         while(_loc12_ < this._3254._2126.length)
         {
            _loc10_ = this._3254._2126[_loc12_];
            _loc15_ = _loc10_.name;
            _loc5_ = this._5844[_loc15_];
            if(_loc10_._13655 is _757)
            {
               _loc11_ = _694._3996(this,_loc10_,_loc5_);
            }
            else if(_loc10_._13655 is _13550)
            {
               _loc11_ = _694._3996(this._13739[_loc10_._13655],_loc10_,_loc5_);
            }
            this._13748[_loc10_] = _loc11_;
            _loc12_++;
         }
      }
      
      private function _10560() : void
      {
         var _loc2_:_13550 = null;
         var _loc4_:_50 = null;
         var _loc1_:Array = _3670._13788;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc2_ = _loc1_[_loc3_];
            _loc2_._13695 = this._13934(_loc2_._13939,_loc2_._13751);
            _loc3_++;
         }
         var _loc5_:int = 0;
         while(_loc5_ < this._3254._2126.length)
         {
            (_loc4_ = this._3254._2126[_loc5_])._13655 = this._13934(_loc4_.libraryParentName,_loc4_.libraryParentType);
            _loc5_++;
         }
      }
      
      private function _13934(param1:String, param2:int) : Object
      {
         var _loc4_:_13550 = null;
         var _loc5_:int = 0;
         var _loc3_:Array = _3670._13788;
         if(param2 == 0)
         {
            return _3670;
         }
         if(param2 == _13550.LIBRARYVITUALFOLDERVO)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               _loc4_ = _loc3_[_loc5_];
               if(_loc4_.name == param1)
               {
                  return _loc4_;
               }
               _loc5_++;
            }
            return null;
         }
         return _3670;
      }
      
      private function _13936(param1:String) : _50
      {
         var _loc3_:String = null;
         if(!this._3254._2126 || this._3254._2126.length == 0)
         {
            return null;
         }
         var _loc2_:_50 = null;
         var _loc4_:int = 0;
         while(_loc4_ < this._3254._2126.length)
         {
            _loc3_ = this._3254._2126[_loc4_].name;
            if(_loc3_ == param1)
            {
               _loc2_ = this._3254._2126[_loc4_];
               break;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function _2950(param1:String, param2:String) : void
      {
         var _2952:String = param1;
         var newName:String = param2;
         var refreshArmatrueName:Function = function(param1:Array):void
         {
            var _loc2_:int = 0;
            while(_loc2_ < param1.length)
            {
               if(param1[_loc2_] is _13549)
               {
                  refreshArmatrueName((param1[_loc2_] as _13549).children);
               }
               else if(param1[_loc2_] is _694)
               {
                  (param1[_loc2_] as _694)._5839();
               }
               _loc2_++;
            }
         };
         this._5844[newName] = this._5844[_2952];
         refreshArmatrueName(this.children);
         delete this._5844[_2952];
         this._11749();
      }
      
      public function _2867(param1:_50, param2:String, param3:Object = null) : void
      {
         var _loc8_:Object = null;
         var _loc9_:_694 = null;
         var _loc10_:_694 = null;
         var _loc4_:String = this.getRelativePath(param2,this._5841.projectPath);
         var _loc5_:_733 = this._5849[_loc4_];
         if(_loc5_ == null)
         {
            _loc5_ = _734._5845(param2,_loc4_);
            this._5849[_loc4_] = _loc5_;
         }
         var _loc6_:String = param1.name;
         var _loc7_:_695;
         (_loc7_ = new _695(_loc5_)).name = _loc4_;
         this._5843.push(_loc7_);
         this._5844[_loc6_] = _loc7_;
         this._5841._3284[_loc6_] = _loc7_.name;
         if(param3)
         {
            if(param3 is _757)
            {
               _loc8_ = this;
            }
            else if(param3 is _13550)
            {
               _loc8_ = this._13739[param3];
            }
            _loc9_ = _694._3996(_loc8_ as _702,param1,_loc7_);
            this._13748[param1] = _loc9_;
         }
         else
         {
            (_loc10_ = new _694(param1,_loc7_)).parent = this;
            children.push(_loc10_);
            this._13748[param1] = _loc10_;
         }
         this._11749();
      }
      
      public function _2863(param1:String) : void
      {
         var armatureName:String = param1;
         var deleteArmatrue:Function = function(param1:Array):void
         {
            var _loc2_:int = 0;
            while(_loc2_ < param1.length)
            {
               if(param1[_loc2_] is _13549)
               {
                  deleteArmatrue((param1[_loc2_] as _13549).children);
               }
               else if(param1[_loc2_] is _694 && (param1[_loc2_] as _694)._4161.name == armatureName)
               {
                  param1.splice(_loc2_,1);
               }
               _loc2_++;
            }
         };
         delete this._5843[armatureName];
         delete this._13748[this._13936(armatureName)];
         deleteArmatrue(this.children);
      }
      
      public function _13937(param1:String) : void
      {
         var vitualFolderName:String = param1;
         var deleteVitualModel:Function = function(param1:Array):void
         {
            var _loc2_:_13549 = null;
            var _loc3_:int = 0;
            while(_loc3_ < param1.length)
            {
               if(param1[_loc3_] is _13549)
               {
                  _loc2_ = param1[_loc3_] as _13549;
                  if(_loc2_.vo.name == vitualFolderName)
                  {
                     param1.splice(_loc3_,1);
                     break;
                  }
                  deleteVitualModel((param1[_loc3_] as _13549).children);
               }
               _loc3_++;
            }
         };
         deleteVitualModel(this.children);
      }
      
      public function _13790(param1:_13550) : void
      {
         var _loc2_:_13549 = _13549._3996(this,param1);
         this._5841._13744(param1);
         this._13739[param1] = _loc2_;
         this._11749();
      }
      
      public function _13735(param1:_13550) : void
      {
         this._13937(param1.name);
         this._5841._13743([param1]);
         delete this._13739[param1];
         this._11749();
      }
      
      private function _11749() : void
      {
         children.sort(function(param1:_704, param2:_704):int
         {
            if(param1 == null)
            {
               return 1;
            }
            if(param2 == null)
            {
               return -1;
            }
            return param1.name < param2.name ? -1 : 1;
         });
      }
      
      private function _5847(param1:String, param2:String) : String
      {
         var _loc3_:String = null;
         var _loc9_:int = 0;
         var _loc4_:String = FileUtil.getDirectory(param2);
         _loc4_ = FileUtil.escapePath(_loc4_);
         var _loc5_:String = FileUtil.escapePath(param1);
         var _loc6_:Array = _loc5_.split("/");
         var _loc7_:Array = _loc4_.split("/");
         var _loc8_:int = _loc6_.length > _loc7_.length ? int(_loc7_.length) : int(_loc6_.length);
         var _loc10_:String = _loc6_[0];
         if(_loc10_.indexOf(":") != -1)
         {
            return _loc5_;
         }
         if(_loc10_ == ".")
         {
            return _loc4_;
         }
         _loc9_ = 0;
         _loc8_ = int(_loc6_.length);
         while(_loc9_ < _loc8_)
         {
            if(_loc6_[_loc9_] != "..")
            {
               break;
            }
            _loc9_++;
         }
         var _loc11_:Array = _loc7_.concat();
         if(_loc11_[_loc11_.length - 1] == "")
         {
            _loc11_.pop();
         }
         var _loc12_:int;
         _loc9_ = _loc12_ = _loc9_;
         while(_loc9_ > 0)
         {
            _loc11_.pop();
            _loc9_--;
         }
         _loc9_ = _loc12_;
         _loc8_ = int(_loc6_.length);
         while(_loc9_ < _loc8_)
         {
            _loc11_.push(_loc6_[_loc9_]);
            _loc9_++;
         }
         return _loc11_.join("/");
      }
      
      private function getRelativePath(param1:String, param2:String) : String
      {
         var _loc9_:int = 0;
         var _loc3_:String = FileUtil.getDirectory(param2);
         _loc3_ = FileUtil.escapePath(_loc3_);
         var _loc4_:String = FileUtil.escapePath(param1);
         var _loc5_:int = int(_loc4_.indexOf(_loc3_));
         var _loc6_:Array = _loc4_.split("/");
         var _loc7_:Array = _loc3_.split("/");
         var _loc8_:int = _loc6_.length > _loc7_.length ? int(_loc7_.length) : int(_loc6_.length);
         _loc9_ = 0;
         while(_loc9_ < _loc8_)
         {
            if(_loc6_[_loc9_] != _loc7_[_loc9_])
            {
               break;
            }
            _loc9_++;
         }
         if(_loc9_ == 0)
         {
            return _loc4_;
         }
         var _loc10_:int = _loc9_;
         var _loc11_:* = "";
         _loc9_ = _loc10_;
         while(_loc9_ < _loc7_.length - 1)
         {
            _loc11_ += "../";
            _loc9_++;
         }
         _loc9_ = _loc10_;
         while(_loc9_ < _loc6_.length - 1)
         {
            _loc11_ += _loc6_[_loc9_] + "/";
            _loc9_++;
         }
         if(_loc11_ == "")
         {
            _loc11_ = "./";
         }
         return _loc11_;
      }
      
      public function _4147(param1:String) : void
      {
         var _loc2_:_694 = null;
         if(this._5842)
         {
            this._5842.close();
         }
         _loc2_ = this._13935(param1,this.children);
         if(_loc2_)
         {
            _loc2_.open();
            this._5842 = _loc2_;
         }
      }
      
      public function _4154(param1:String) : void
      {
         if(this._5842)
         {
            if(this._5842.name == param1)
            {
               return;
            }
            this._5842.close();
         }
         var _loc2_:_694 = this._13935(param1,this.children);
         if(_loc2_)
         {
            _loc2_.open();
            this._5842 = _loc2_;
         }
      }
      
      private function _13935(param1:String, param2:Array) : _694
      {
         var _loc3_:_694 = null;
         var _loc4_:_704 = null;
         var _loc7_:_13549 = null;
         var _loc5_:int = 0;
         var _loc6_:int = int(param2.length);
         while(_loc5_ < _loc6_)
         {
            _loc4_ = param2[_loc5_];
            if(_loc4_ is _13549)
            {
               _loc7_ = _loc4_ as _13549;
               _loc3_ = this._13935(param1,_loc7_.children);
               if(_loc3_)
               {
                  return _loc3_;
               }
            }
            else if(_loc4_ is _694)
            {
               if(_loc4_.name == param1)
               {
                  return _loc4_ as _694;
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function _4188() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc4_:Boolean = false;
         if(this._5843 == null || this._5843.length == 0)
         {
            return false;
         }
         var _loc2_:int = 0;
         var _loc3_:int = int(this._5843.length);
         while(_loc2_ < _loc3_)
         {
            if(this._5843[_loc2_])
            {
               _loc4_ = this._5843[_loc2_]._4188();
               _loc1_ = (_loc4_) || _loc1_;
               if(_loc1_)
               {
                  return _loc1_;
               }
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function _4160() : String
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this._5843 != null)
         {
            _loc2_ = 0;
            _loc3_ = int(this._5843.length);
            while(_loc2_ < _loc3_)
            {
               if(this._5843[_loc2_] != null)
               {
                  _loc1_ = this._5843[_loc2_]._4160();
               }
               if(_loc1_ != null)
               {
                  return _loc1_;
               }
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      public function _4159(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc6_:_733 = null;
         var _loc7_:_695 = null;
         if(this._5841 == null || this._5843 == null || this._3811 == null || this._4162 == null || this._4162._3678 == null || this._5841._3284 == null)
         {
            return;
         }
         var _loc2_:String = this.getRelativePath(param1,this._5841.projectPath);
         var _loc4_:int = 0;
         var _loc5_:int = int(this._5843.length);
         while(_loc4_ < _loc5_)
         {
            if(this._5843[_loc4_].libraryVO == this._3811)
            {
               _loc3_++;
            }
            _loc4_++;
         }
         if(_loc3_ > 1)
         {
            this._5843.splice(this._5843.indexOf(this._4162._3678),1);
            _loc6_ = _734._5845(param1,_loc2_);
            (_loc7_ = new _695(_loc6_)).parent = this;
            _loc7_.name = _loc2_;
            this._5843.push(_loc7_);
            this._5844[this._4162.name] = _loc7_;
            this._4162._3678 = _loc7_;
         }
         else
         {
            this._3811._5846(param1);
            this._4162._3678.name = _loc2_;
            this._4162._3678.clear();
         }
         this._5841._3284[this._4162.name] = _loc2_;
         this._5841.refresh();
      }
      
      public function _14692(param1:String) : void
      {
         var _loc2_:String = this.getRelativePath(param1,this._5841.projectPath);
         this._3811._5846(param1);
         this._4162._3678.name = _loc2_;
         this._4162._3678.clear();
         this._5841._3284[this._4162.name] = _loc2_;
         this._5841.refresh();
      }
      
      public function _4141() : void
      {
         var _loc1_:_50 = null;
         var _loc2_:_79 = null;
         var _loc3_:_691 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_70 = null;
         if(this._5842)
         {
            this._5842._5834();
            _loc1_ = this._5842._4161._1886;
            _loc4_ = 0;
            _loc5_ = int(_loc1_._1780.length);
            while(_loc4_ < _loc5_)
            {
               _loc2_ = _loc1_._1780[_loc4_];
               for each(_loc6_ in _loc2_._1765)
               {
                  _loc3_ = this._5842._5832(_loc6_._2104);
                  if(_loc3_)
                  {
                     ++_loc3_.count;
                  }
               }
               _loc4_++;
            }
         }
      }
      
      public function _3809(param1:String) : _723
      {
         var _loc2_:_694 = this._13935(param1,this.children);
         if(_loc2_)
         {
            return _loc2_._4161;
         }
         return null;
      }
      
      public function _3805(param1:String) : _733
      {
         var _loc2_:_733 = null;
         if(this._5844[param1])
         {
            _loc2_ = (this._5844[param1] as _695).libraryVO;
         }
         return _loc2_;
      }
      
      public function _4138(param1:String) : String
      {
         if(this._5844[param1])
         {
            return (this._5844[param1] as _695).libraryPath;
         }
         return null;
      }
      
      public function get _5841() : _757
      {
         return _3670 as _757;
      }
      
      override public function get name() : String
      {
         return "library";
      }
      
      public function _3680() : String
      {
         return this._5842._3678.libraryPath;
      }
      
      public function get _3811() : _733
      {
         return this._5842._3678.libraryVO;
      }
      
      public function get _4162() : _694
      {
         return this._5842;
      }
      
      public function _13274(param1:_50, param2:Array) : _694
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_694 = null;
         var _loc6_:_694 = null;
         var _loc7_:_13549 = null;
         _loc3_ = 0;
         _loc4_ = int(param2.length);
         while(_loc3_ < _loc4_)
         {
            if(param2[_loc3_] is _694)
            {
               _loc6_ = param2[_loc3_] as _694;
               if(Boolean(_loc6_._4161) && _loc6_._4161._1886 == param1)
               {
                  return _loc6_;
               }
            }
            else if(param2[_loc3_] is _13549)
            {
               _loc7_ = param2[_loc3_] as _13549;
               _loc5_ = this._13274(param1,_loc7_.children);
               if(_loc5_)
               {
                  return _loc5_;
               }
            }
            _loc3_++;
         }
         return _loc5_;
      }
      
      public function dispose() : void
      {
         var _loc3_:Object = null;
         var _loc1_:int = 0;
         var _loc2_:int = int(this._5848.length);
         while(_loc1_ < _loc2_)
         {
            this._5848[_loc1_].dispose();
            _loc1_++;
         }
         this._5848.length = 0;
         this._5849 = null;
         this._5843 = null;
         this._5844 = null;
         for(_loc3_ in this._13739)
         {
            delete this._13739[_loc3_];
         }
         System.gc();
      }
      
      public function addChild(param1:_704) : void
      {
         _84._1979(param1,_5822);
      }
      
      public function removeChild(param1:_704) : void
      {
         _84._1958(param1,_5822);
      }
      
      public function _13738(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            delete this._13739[param1[_loc2_]];
            _loc2_++;
         }
      }
      
      public function _13737(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            delete this._13748[param1[_loc2_]];
            _loc2_++;
         }
      }
      
      public function _13938(param1:_13550, param2:_13549) : void
      {
         this._13739[param1] = param2;
      }
   }
}

