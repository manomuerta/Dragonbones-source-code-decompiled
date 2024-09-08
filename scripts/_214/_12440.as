package _214
{
   import _13503._13502;
   import _13505._13504;
   import _13505._13507;
   import _13505._13508;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import egret.utils.FileUtil;
   import flash.utils.Dictionary;
   
   public class _12440
   {
      public var _12520:_52;
      
      public var _12522:Vector.<_79>;
      
      private var _12524:Vector.<String>;
      
      public var _12523:Vector.<String>;
      
      public var _12521:String;
      
      public var _14377:Dictionary;
      
      public var _14376:Dictionary;
      
      public var _14378:Dictionary;
      
      public function _12440()
      {
         this._12522 = new Vector.<_79>();
         super();
         this._12524 = new Vector.<String>();
         this._12523 = new Vector.<String>();
         this._14377 = new Dictionary();
         this._14376 = new Dictionary();
         this._14378 = new Dictionary();
      }
      
      public function copyFrom(param1:_52, param2:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_79 = null;
         var _loc11_:_52 = null;
         var _loc12_:_70 = null;
         var _loc13_:_52 = null;
         var _loc15_:Vector.<_52> = null;
         var _loc17_:_13502 = null;
         var _loc18_:_13504 = null;
         var _loc19_:_13508 = null;
         var _loc20_:_13507 = null;
         var _loc21_:_52 = null;
         var _loc22_:_79 = null;
         var _loc23_:Vector.<String> = null;
         var _loc24_:_13504 = null;
         var _loc25_:_13508 = null;
         var _loc26_:_70 = null;
         var _loc27_:_13507 = null;
         var _loc28_:_79 = null;
         var _loc3_:_50 = param1.rootArmatureData;
         if(_loc3_ == null)
         {
            return;
         }
         this._12524.length = 0;
         this._12523.length = 0;
         this._14377 = new Dictionary();
         this._14376 = new Dictionary();
         this._14378 = new Dictionary();
         var _loc14_:Vector.<_52> = param1._2021();
         _loc14_.unshift(param1);
         this._12520 = param1.clone();
         _loc15_ = this._12520._2021();
         _loc15_.unshift(this._12520);
         this._12522.length = 0;
         _loc4_ = 0;
         _loc5_ = int(_loc3_._1780.length);
         while(_loc4_ < _loc5_)
         {
            _loc10_ = _loc3_._1780[_loc4_];
            if((Boolean(_loc11_ = _loc10_.parentBoneData)) && _loc14_.indexOf(_loc11_) != -1)
            {
               _loc13_ = this._12518(_loc11_.name,_loc15_);
               if(_loc13_)
               {
                  (_loc22_ = _loc10_.clone()).parentBoneData = _loc13_;
                  _loc22_._1789();
                  this._12522.push(_loc22_);
                  _loc6_ = 0;
                  _loc7_ = int(_loc10_._1715.length);
                  while(_loc6_ < _loc7_)
                  {
                     _loc12_ = _loc10_._1765[_loc10_._1715[_loc6_]];
                     if((Boolean(_loc12_)) && Boolean(_loc12_._2104))
                     {
                        _loc23_ = _loc12_._2104._10584();
                        _loc8_ = 0;
                        _loc9_ = int(_loc23_.length);
                        while(_loc8_ < _loc9_)
                        {
                           if(this._12524.indexOf(_loc23_[_loc8_]) == -1)
                           {
                              this._12524.push(_loc23_[_loc8_]);
                           }
                           _loc8_++;
                        }
                     }
                     _loc6_++;
                  }
               }
            }
            _loc4_++;
         }
         this._12521 = FileUtil.escapePath(param2);
         var _loc16_:int = this._12521.length;
         _loc4_ = 0;
         _loc5_ = int(this._12524.length);
         while(_loc4_ < _loc5_)
         {
            if(this._12524[_loc4_].indexOf(this._12521) == 0)
            {
               this._12523.push(this._12524[_loc4_].substr(_loc16_));
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc14_.length)
         {
            _loc21_ = _loc14_[_loc4_];
            _loc6_ = 0;
            while(_loc6_ < _loc3_._13619.length)
            {
               _loc17_ = _loc3_._13619[_loc6_];
               _loc18_ = _loc17_._1873(_loc21_);
               if(this._14377[_loc17_.name] == null)
               {
                  this._14377[_loc17_.name] = [];
               }
               if(_loc18_)
               {
                  (_loc24_ = _loc18_.clone() as _13504)._1823 = this._12518(_loc24_.name,_loc15_);
                  this._14377[_loc17_.name].push(_loc24_);
               }
               _loc6_++;
            }
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(_loc3_._1780.length);
         while(_loc4_ < _loc5_)
         {
            _loc10_ = _loc3_._1780[_loc4_];
            if((Boolean(_loc11_ = _loc10_.parentBoneData)) && _loc14_.indexOf(_loc11_) != -1)
            {
               _loc13_ = this._12518(_loc11_.name,_loc15_);
               if(_loc13_)
               {
                  _loc6_ = 0;
                  while(_loc6_ < _loc3_._13619.length)
                  {
                     _loc17_ = _loc3_._13619[_loc6_];
                     _loc19_ = _loc17_._1875(_loc10_);
                     if(this._14376[_loc17_.name] == null)
                     {
                        this._14376[_loc17_.name] = [];
                     }
                     if(_loc19_)
                     {
                        (_loc25_ = _loc19_.clone() as _13508)._1824 = this._14379(_loc25_.name,this._12522);
                        this._14376[_loc17_.name].push(_loc25_);
                     }
                     if(this._14378[_loc17_.name] == null)
                     {
                        this._14378[_loc17_.name] = [];
                     }
                     _loc8_ = 0;
                     while(_loc8_ < _loc10_._1715.length)
                     {
                        _loc26_ = _loc10_._1765[_loc10_._1715[_loc8_]];
                        if(_loc26_._2165)
                        {
                           _loc20_ = _loc17_._1881(_loc26_);
                           if(_loc20_)
                           {
                              _loc27_ = _loc20_.clone() as _13507;
                              _loc28_ = this._14379(_loc10_.name,this._12522);
                              _loc27_._1826 = _loc28_._1765[_loc28_._1715[_loc8_]];
                              this._14378[_loc17_.name].push(_loc27_);
                           }
                        }
                        _loc8_++;
                     }
                     _loc6_++;
                  }
               }
            }
            _loc4_++;
         }
      }
      
      private function _12518(param1:String, param2:Vector.<_52>) : _52
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param2.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(param2[_loc3_].name == param1)
            {
               return param2[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      private function _14379(param1:String, param2:Vector.<_79>) : _79
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param2.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(param2[_loc3_].name == param1)
            {
               return param2[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
   }
}

