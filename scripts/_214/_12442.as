package _214
{
   import _13503._13502;
   import _13505._13507;
   import _13505._13508;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import egret.utils.FileUtil;
   import flash.utils.Dictionary;
   
   public class _12442
   {
      public var _12519:_79;
      
      private var _12524:Vector.<String>;
      
      public var _12523:Vector.<String>;
      
      public var _12521:String;
      
      public var _14376:Dictionary;
      
      public var _14378:Dictionary;
      
      public function _12442()
      {
         super();
         this._12524 = new Vector.<String>();
         this._12523 = new Vector.<String>();
         this._14376 = new Dictionary();
         this._14378 = new Dictionary();
      }
      
      public function copyFrom(param1:_79, param2:String) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:_70 = null;
         var _loc13_:_13502 = null;
         var _loc14_:_13508 = null;
         var _loc15_:_13507 = null;
         var _loc16_:Vector.<String> = null;
         var _loc17_:_13508 = null;
         var _loc18_:_70 = null;
         var _loc19_:_13507 = null;
         var _loc3_:_52 = param1.parentBoneData;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:_50 = _loc3_.rootArmatureData;
         if(_loc4_ == null)
         {
            return;
         }
         this._12524.length = 0;
         this._12523.length = 0;
         this._14376 = new Dictionary();
         this._14378 = new Dictionary();
         this._12519 = param1.clone();
         this._12519._1789();
         _loc7_ = 0;
         _loc8_ = int(param1._1715.length);
         while(_loc7_ < _loc8_)
         {
            _loc11_ = param1._1765[param1._1715[_loc7_]];
            if((Boolean(_loc11_)) && Boolean(_loc11_._2104))
            {
               _loc16_ = _loc11_._2104._10584();
               _loc9_ = 0;
               _loc10_ = int(_loc16_.length);
               while(_loc9_ < _loc10_)
               {
                  if(this._12524.indexOf(_loc16_[_loc9_]) == -1)
                  {
                     this._12524.push(_loc16_[_loc9_]);
                  }
                  _loc9_++;
               }
            }
            _loc7_++;
         }
         this._12521 = FileUtil.escapePath(param2);
         var _loc12_:int = this._12521.length;
         _loc5_ = 0;
         _loc6_ = int(this._12524.length);
         while(_loc5_ < _loc6_)
         {
            if(this._12524[_loc5_].indexOf(this._12521) == 0)
            {
               this._12523.push(this._12524[_loc5_].substr(_loc12_));
            }
            _loc5_++;
         }
         _loc7_ = 0;
         while(_loc7_ < _loc4_._13619.length)
         {
            _loc13_ = _loc4_._13619[_loc7_];
            if(_loc14_ = _loc13_._1875(param1))
            {
               (_loc17_ = _loc14_.clone() as _13508)._1824 = this._12519;
               this._14376[_loc13_.name] = _loc17_;
            }
            if(this._14378[_loc13_.name] == null)
            {
               this._14378[_loc13_.name] = [];
            }
            _loc9_ = 0;
            while(_loc9_ < param1._1715.length)
            {
               _loc18_ = param1._1765[param1._1715[_loc9_]];
               if(_loc18_._2165)
               {
                  _loc15_ = _loc13_._1881(_loc18_);
                  if(_loc15_)
                  {
                     (_loc19_ = _loc15_.clone() as _13507)._1826 = this._12519._1765[this._12519._1715[_loc9_]];
                     this._14378[_loc13_.name].push(_loc19_);
                  }
               }
               _loc9_++;
            }
            _loc7_++;
         }
      }
   }
}

