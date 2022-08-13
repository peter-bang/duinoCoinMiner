static int get_duino_hash_data (char* data, char* separator, char* last_block_hash, char* expected_hash, uint32_t* difficulty)
{
    bool ret= 0;

    int idx_cnt1= 0; 
    int idx_cnt2= 0;
    uint32_t temp_num= 0;

    char temp_data[DUINO_MSG_LEN_TOTAL];
    char temp_out1[DUINO_MSG_LEN_HASH];
    char temp_out2[DUINO_MSG_LEN_HASH];

    if (data[0] == NULL)
      return -1;

    memset(temp_data, 0x00, DUINO_MSG_LEN_TOTAL);
    memset(temp_out1, 0x00, DUINO_MSG_LEN_HASH);
    memset(temp_out2, 0x00, DUINO_MSG_LEN_HASH);

    memcpy(temp_data, data, DUINO_MSG_LEN_TOTAL);

    while (idx_cnt1 <= DUINO_MSG_LEN_TOTAL) 
    {
        if (temp_data[idx_cnt1] == *separator) break;
        if (idx_cnt1 == DUINO_MSG_LEN_HASH)    return 1;
  
        temp_out1[idx_cnt1]= temp_data[idx_cnt1];
        idx_cnt1++;
    }
    memcpy(last_block_hash, temp_out1, idx_cnt1);

    idx_cnt1++; // jump ,
    while (idx_cnt1 <= DUINO_MSG_LEN_TOTAL) 
    {
        if (temp_data[idx_cnt1] == *separator) break;
        if (idx_cnt1 == DUINO_MSG_LEN_TOTAL)   return 2;
        
        temp_out2[idx_cnt2]= temp_data[idx_cnt1];
        idx_cnt1++; 
        idx_cnt2++;
    }    
    memcpy(expected_hash, temp_out2, idx_cnt2);

    idx_cnt1++; // jump ,
    temp_num= atol(&temp_data[idx_cnt1]) ;
    if (temp_num==0) return 3;

    *difficulty= temp_num*100+1;

    return 0;
}