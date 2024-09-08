package _521
{
   import _6._7;
   import _81._91;
   
   public class _533 extends _7
   {
      protected var _3783:_91;
      
      protected var _3780:Vector.<_91>;
      
      public function _533()
      {
         super();
         this._3780 = new Vector.<_91>();
      }
      
      public function stop() : void
      {
         dispose();
      }
      
      public function get _3053() : _91
      {
         return this._3783;
      }
      
      public function set _3053(param1:_91) : void
      {
         if(this._3783 != param1)
         {
            this._3783 = param1;
            this._3777(this._3783);
         }
      }
      
      public function get _2889() : Vector.<_91>
      {
         return this._3780;
      }
      
      public function isSelected(param1:_91) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         return this._3780.indexOf(param1) != -1;
      }
      
      public function _3024() : void
      {
         this._2986(null);
      }
      
      public function _2986(param1:Vector.<_91>, param2:_91 = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 == null && param2 == null && this._3780.length == 0)
         {
            return;
         }
         if(Boolean(param2) && this._3780.length == 1)
         {
            if(this._3780[0] == param2)
            {
               return;
            }
         }
         this._3780.length = 0;
         if(param2)
         {
            this._3780.push(param2);
         }
         else if(param1)
         {
            _loc3_ = 0;
            _loc4_ = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               this._3780.push(param1[_loc3_]);
               _loc3_++;
            }
         }
         this._3778();
      }
      
      public function _3877(param1:Vector.<_91>, param2:_91 = null) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2)
         {
            if(this._3780.indexOf(param2) == -1)
            {
               this._3780.push(param2);
               _loc3_ = true;
            }
         }
         else if(param1)
         {
            _loc4_ = 0;
            _loc5_ = int(param1.length);
            while(_loc4_ < _loc5_)
            {
               if(this._3780.indexOf(param1[_loc4_]) == -1)
               {
                  this._3780.push(param1[_loc4_]);
                  _loc3_ = true;
               }
               _loc4_++;
            }
         }
         if(_loc3_)
         {
            this._3778();
         }
      }
      
      public function _3876(param1:Vector.<_91>, param2:_91 = null) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param2)
         {
            _loc4_ = int(this._3780.indexOf(param2));
            if(_loc4_ != -1)
            {
               this._3780.splice(_loc4_,1);
               _loc3_ = true;
            }
         }
         else if(param1)
         {
            _loc5_ = 0;
            _loc6_ = int(param1.length);
            while(_loc5_ < _loc6_)
            {
               _loc4_ = int(this._3780.indexOf(param1[_loc5_]));
               if(_loc4_ != -1)
               {
                  this._3780.splice(_loc4_,1);
                  _loc3_ = true;
               }
               _loc5_++;
            }
         }
         if(_loc3_)
         {
            this._3778();
         }
      }
      
      public function _3874(param1:Vector.<_91>, param2:_91 = null) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2)
         {
            if(!this.isSelected(param2))
            {
               this._3877(null,param2);
            }
         }
         else if(param1)
         {
            _loc3_ = false;
            _loc4_ = 0;
            _loc5_ = int(param1.length);
            while(_loc4_ < _loc5_)
            {
               if(!this.isSelected(param1[_loc4_]))
               {
                  _loc3_ = true;
                  break;
               }
               _loc4_++;
            }
            if(_loc3_)
            {
               this._3877(param1,param2);
            }
            else if(param1.length != this._3780.length)
            {
               this._3875(param1,param2);
            }
         }
      }
      
      public function _3875(param1:Vector.<_91>, param2:_91 = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2)
         {
            _loc3_ = int(this._3780.indexOf(param2));
            if(_loc3_ != -1)
            {
               this._3780.splice(_loc3_,1);
            }
            else
            {
               this._3780.push(param2);
            }
         }
         else if(param1)
         {
            _loc4_ = 0;
            _loc5_ = int(param1.length);
            while(_loc4_ < _loc5_)
            {
               _loc3_ = int(this._3780.indexOf(param1[_loc4_]));
               if(_loc3_ != -1)
               {
                  this._3780.splice(_loc3_,1);
               }
               else
               {
                  this._3780.push(param1[_loc4_]);
               }
               _loc4_++;
            }
         }
         this._3778();
      }
      
      protected function _3777(param1:_91) : void
      {
      }
      
      protected function _3778() : void
      {
      }
   }
}

