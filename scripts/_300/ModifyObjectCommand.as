package _300
{
   import _11111._11110;
   import _470._11495;
   import _93._92;
   
   public class ModifyObjectCommand extends _92
   {
      public var _11559:* = null;
      
      private var _11561:Vector.<_11495> = null;
      
      private var _11558:Function = null;
      
      public function ModifyObjectCommand()
      {
         super();
         this._2219 = true;
         this._2215 = true;
      }
      
      protected function _11314() : void
      {
      }
      
      override public function execute() : void
      {
         var i:uint = 0;
         var l:uint = 0;
         var modifyObjectVO:_11495 = null;
         var params:Array = this._2223 as Array;
         if(params)
         {
            this._11559 = params[0];
            this._11561 = params[1];
            this._11558 = params[2];
            if(Boolean(this._11561) && this._11561.length > 0)
            {
               i = 0;
               l = this._11561.length;
               while(i < l)
               {
                  modifyObjectVO = this._11561[i];
                  if(modifyObjectVO)
                  {
                     modifyObjectVO.setTo();
                  }
                  i++;
               }
               try
               {
                  if(this._11558 != null)
                  {
                     if(this._11558.length === 1)
                     {
                        this._11558(this._11561);
                     }
                     else if(this._11558.length === 2)
                     {
                        this._11558(this._11559,this._11561);
                     }
                     else
                     {
                        this._11558();
                     }
                  }
                  this._11314();
               }
               catch(e:Error)
               {
                  _11110.instance._11204._11132("ModifyObjectCommand::execute",e);
               }
            }
         }
      }
      
      override public function revert() : void
      {
         var i:uint = 0;
         var l:uint = 0;
         var modifyObjectVO:_11495 = null;
         if(Boolean(this._11561) && this._11561.length > 0)
         {
            i = 0;
            l = this._11561.length;
            while(i < l)
            {
               modifyObjectVO = this._11561[i];
               if(modifyObjectVO)
               {
                  modifyObjectVO._11560();
               }
               i++;
            }
            try
            {
               if(this._11558 != null)
               {
                  if(this._11558.length === 1)
                  {
                     this._11558(this._11561);
                  }
                  else if(this._11558.length === 2)
                  {
                     this._11558(this._11559,this._11561);
                  }
                  else
                  {
                     this._11558();
                  }
               }
               this._11314();
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("ModifyObjectCommand::revert",e);
            }
         }
      }
   }
}

