package _214
{
   import _13503._13502;
   import _13505._13507;
   import _51._50;
   import _51._70;
   import egret.utils.FileUtil;
   import flash.utils.Dictionary;
   
   public class _12441
   {
      public var _12525:_70;
      
      private var _12524:Vector.<String>;
      
      public var _12523:Vector.<String>;
      
      public var _12521:String;
      
      public var _14378:Dictionary;
      
      public function _12441()
      {
         super();
         this._12524 = new Vector.<String>();
         this._12523 = new Vector.<String>();
         this._14378 = new Dictionary();
      }
      
      public function copyFrom(param1:_70, param2:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc10_:_13502 = null;
         var _loc11_:_13507 = null;
         var _loc12_:Vector.<String> = null;
         var _loc13_:_13507 = null;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:_50 = param1._1760.rootArmatureData;
         if(_loc3_ == null)
         {
            return;
         }
         this._12524.length = 0;
         this._12523.length = 0;
         this._14378 = new Dictionary();
         this._12525 = param1._14298(param1._1760.rootArmatureData);
         this._12525._1789();
         if(param1._2104)
         {
            _loc12_ = param1._2104._10584();
            _loc6_ = 0;
            _loc7_ = int(_loc12_.length);
            while(_loc6_ < _loc7_)
            {
               if(this._12524.indexOf(_loc12_[_loc6_]) == -1)
               {
                  this._12524.push(_loc12_[_loc6_]);
               }
               _loc6_++;
            }
         }
         this._12521 = FileUtil.escapePath(param2);
         var _loc8_:int = this._12521.length;
         _loc4_ = 0;
         _loc5_ = int(this._12524.length);
         while(_loc4_ < _loc5_)
         {
            if(this._12524[_loc4_].indexOf(this._12521) == 0)
            {
               this._12523.push(this._12524[_loc4_].substr(_loc8_));
            }
            _loc4_++;
         }
         var _loc9_:int = 0;
         _loc9_ = 0;
         while(_loc9_ < _loc3_._13619.length)
         {
            _loc10_ = _loc3_._13619[_loc9_];
            if(this._14378[_loc10_.name] == null)
            {
               this._14378[_loc10_.name] = [];
            }
            if(param1._2165)
            {
               _loc11_ = _loc10_._1881(param1);
               if(_loc11_)
               {
                  (_loc13_ = _loc11_.clone() as _13507)._1826 = this._12525;
                  this._14378[_loc10_.name].push(_loc13_);
               }
            }
            _loc9_++;
         }
      }
   }
}

